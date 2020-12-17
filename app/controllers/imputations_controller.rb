class ImputationsController < ApplicationController
  authorize_resource
  before_action :authenticate_user!
  

  before_action :set_imputation, only: [:show, :edit, :update, :destroy]
  before_action :get_resource, only: [:index, :new, :edit]
  #before_action :set_request, only: [:index, :new]
  #before_action :get_arrival_mail, only: [:create]

  layout "dashboard"
  # GET /imputations
  # GET /imputations.json
  def index
    

    if params[:rtype].present? && params[:rtype] == "ArrivalMail"
      @imputations = @arrival_mail.imputations
    elsif params[:rtype].present? && params[:rtype] == "Request"
      @imputations = @request.imputations
    elsif params[:rtype].present? && params[:rtype] == "Document"
      @imputations = @document.imputations

    elsif !params[:rtype].present? && !params[:rtype]
      @imputations = Imputation.where("recipient_id = ? OR user_id = ?", current_user.id, current_user.id)

    end

    record_activity("Afficher la liste des imputations.")


  end

  # GET /imputations/1
  # GET /imputations/1.json
  def show
    unless @imputation.viewed_at.present?
      @imputation.update_column(:viewed_at, Time.now)
    end
  end

  def get_profiles
    
    if params[:data].present?
      service = Service.find(params[:data])
      puts "SERVICE: #{service.inspect}"
      @recipients = Profile.where(service_id: service.id)

      puts "RECIPIENT: #{@recipients}"
    end
  end
  # GET /imputations/new
  def new
    @directions = Direction.all
    @divisions = Division.all
    @services = Service.all
   
   

    role_ids = Role.where("name NOT IN (?)", ["superuser"]).map {|role| role.id}
    @recipients = User.where("role_id IN (?)", role_ids).map {|user| user.profile }
    puts "RECIPIENTS: #{@recipients}"
    @imputation = Imputation.new

  end

  # GET /imputations/1/edit
  def edit
    @directions = Direction.all
    @divisions = Division.all
    @services = Service.all
    
   
  
    role_ids = Role.where("name NOT IN (?)", ["superuser"]).map {|role| role.id}
    @recipients = User.where("role_id  IN (?)", role_ids).map {|user| user.profile}
    
  end

  def get_divisions
    puts "ID: #{params[:id]}"
    @divisions = Division.where(direction_id: params[:id]).map { |division| [division.name, division.id] }.unshift('Sélectionner')
  end

  def get_services
    puts "ID: #{params[:id]}"
    @services = Service.where(division_id: params[:id]).map { |service| [service.name, service.id] }.unshift('Sélectionner')
  end


  # POST /imputations
  # POST /imputations.json
  def create

    if flash[:rtype].present? && flash[:rtype] == "ArrivalMail"
      resource = ArrivalMail.find(flash[:arrival_mail]["id"])

    elsif flash[:rtype].present? && flash[:rtype] == "Request"
      resource = Request.find(flash[:request]["id"])
    else
      return
    end

    @imputation = current_user.imputations.build(imputation_params)

    #Imputable
    @imputation.imputable = resource
    #ImputationsService.imputable(resource)
    
    notification_content = "Un courrier ou demande vous a été imputé."
   

    respond_to do |format|
      if @imputation.save
        record_activity("Créer une nouvelle imputation (ID: #{@imputation.id})")

         #Notificable
        NotificationsService.notificate(@imputation.recipient_id, @imputation, notification_content)
        
        # New thread to send mail
        Thread.new do
					Rails.application.executor.wrap do
            ImputationMailer.new_imputation_mail(@imputation.recipient_id, @imputation).deliver_now

					end
        end
          
        if flash[:rtype].present? && flash[:rtype] == "ArrivalMail"
          @imputations = resource.imputations

        elsif flash[:rtype].present? && flash[:rtype] == "Request"
          @imputations = resource.imputations
        end
        
        format.html { redirect_to imputations_path(uid: flash[:rtype].constantize.find(@imputation.imputable_id).uid, rtype: flash[:rtype]), notice: 'Imputation was successfully created.' }
        format.json { render :show, status: :created, location: @imputation }
     
      else
        @directions = Direction.all
        @divisions = Division.all
        @services = Service.all
        
        role_ids = Role.where("name NOT IN (?)", ["superuser"]).map {|role| role.id}
        @recipients = User.where("role_id IN (?)", role_ids).map {|user| user.profile }
        
        format.html { render :new}
        format.json { render json: @imputation.errors, status: :unprocessable_entity }
      
      end
    end
  end

  # PATCH/PUT /imputations/1
  # PATCH/PUT /imputations/1.json
  def update


   

    respond_to do |format|
      if @imputation.update(imputation_params)
        record_activity("Modifier une imputation (ID: #{@imputation.id})")

        #@imputations = @imputation.imputable_type.constantize.find(@imputation.imputable_id).imputations

        format.html { redirect_to imputations_path(uid: @imputation.imputable_type.constantize.find(@imputation.imputable_id).uid, rtype: @imputation.imputable_type), notice: 'Imputation was successfully updated.' }
        format.json { render :show, status: :ok, location: @imputation }
        
      else
        format.html { render :edit }
        format.json { render json: @imputation.errors, status: :unprocessable_entity }
        
      end
    end
  end


  def delete
    @imputation = Imputation.find(params[:imputation_id])
  end


  # DELETE /imputations/1
  # DELETE /imputations/1.json
  def destroy
    @imputation.destroy
    respond_to do |format|
      record_activity("Supprimer une imputation (ID: #{@imputation.id})")

      format.html { redirect_to imputations_path(uid: @imputation.imputable_type.constantize.find(@imputation.imputable_id).uid, rtype: @imputation.imputable_type), notice: 'Imputation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imputation
        if params[:uid]
        @imputation = Imputation.find_by(uid: params[:uid])
        else 
          @imputation = Imputation.find(params[:id])
        end
    end

    def get_resource
      if params[:rtype].present? && params[:rtype] == "ArrivalMail"
        @arrival_mail ||= ArrivalMail.find_by(uid: params[:uid])
        
        flash[:arrival_mail] = @arrival_mail
        flash[:rtype] = "ArrivalMail"
      elsif params[:rtype].present? && params[:rtype] == "Request"
        
        @request ||= Request.find_by(uid: params[:uid])
        flash[:request] = @request
        flash[:rtype] = "Request"
      elsif params[:rtype].present? && params[:rtype] == "Document"
        
        @document ||= Document.find_by(uid: params[:uid])
        flash[:document] = @document
        flash[:rtype] = "Document"
      
      end
    end

    

    

    # Never trust parameters from the scary internet, only allow the white list through.
    def imputation_params
      params.require(:imputation).permit(:direction_id, :division_id, :service_id, :recipient_id,  imputation_items_attributes: [:id,  :title, :due_date,  :description, :priority, :status, :_destroy])
    end

   
end
