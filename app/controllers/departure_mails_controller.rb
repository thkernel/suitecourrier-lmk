class DepartureMailsController < ApplicationController
  authorize_resource
  before_action :authenticate_user!
  layout "dashboard"
  
  before_action :set_departure_mail, only: [:show, :edit, :update, :destroy, :to_archive]

  # GET /departure_mails
  # GET /departure_mails.json
  def index
    #@departure_mails = DepartureMail.all
    @departure_mails = DepartureMail.where.not(status: "Archived")
    record_activity("Afficher la liste des courriers départ.")


  end


  def get_reference
    data = params[:data]
    
    if data.present?
      register = Register.find(data)
      last_departure_mail = DepartureMail.last(1)
      if last_departure_mail.present?
        @reference = "#{last_departure_mail[0].id}-#{register.name}"
      else
        @reference = "#{1}-#{register.name}"

      end
    end
  end


  def archive
    @departure_mail = DepartureMail.find(params[:departure_mail_id])
  end

  def to_archive

    respond_to do |format|
      if @departure_mail.update_column(:status, "Archived")
  

        format.html { redirect_to departure_mails_path, notice: 'Departure mail was successfully archived.' }
        format.json { render :show, status: :created, location: @departure_mail }
        format.js
      else
        format.html { render :new }
        format.json { render json: @departure_mail.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def archives
    @departure_mails = DepartureMail.where(status: "Archived")
  end


  def bulk_archive_modal
  end

  def bulk_archive
    departure_date = params[:departure_date]
    puts "DEPARTURE DATE: #{departure_date}"
    departure_mails = DepartureMail.where(departure_date: departure_date)

    respond_to do |format|
      if departure_mails.present?
        if departure_mails.update_all(status: "Archived")
    

          format.html { redirect_to departure_mails_archives_path, notice: 'Departure mail was successfully created.' }
          format.json { render :show, status: :created, location: @departure_mail }
          format.js
        end
      else
        format.html { redirect_to departure_mails_archives_path, notice: 'Departure mail was successfully created.' }
        format.json { render json: @departure_mail.errors, status: :unprocessable_entity }
        format.js
      end
    end 
  end

  # GET /departure_mails/1
  # GET /departure_mails/1.json
  #def show
  #end

  # GET /departure_mails/new
  def new

    last_departure_mail = DepartureMail.last(1)
    if last_departure_mail.present? 
      id_str = last_departure_mail[0].id.to_s
      
      if id_str.size == 1
        @internal_reference = "000#{last_departure_mail[0].id+1}|SUP|#{Time.new.month}|#{Time.new.year}"
      elsif id_str.size == 2
        @internal_reference = "00#{last_departure_mail[0].id+1}|SUP|#{Time.new.month}|#{Time.new.year}"
      elsif id_str.size == 3
        @internal_reference = "0#{last_departure_mail[0].id+1}|SUP|#{Time.new.month}|#{Time.new.year}"
      elsif id_str == 4
        @internal_reference = "#{last_departure_mail[0].id+1}|SUP|#{Time.new.month}|#{Time.new.year}"
      end
    else
      
      @internal_reference = "0001|SUP|#{Time.new.month}|#{Time.new.year}"
    end
    
    @departure_mail = DepartureMail.new
   
    
   
    @registers = Register.where("status = ? AND register_type = ?", "Ouvert", "Registre départ")
    
    @natures = Nature.all 
    @supports = Support.all
    @folders = Folder.all
    @correspondents = Correspondent.all


  end

  # GET /departure_mails/1/edit
  def edit
    @registers = Register.all 
    @natures = Nature.all 
    @supports = Support.all
    @folders = Folder.all
    @correspondents = Correspondent.all


  end

  # POST /departure_mails
  # POST /departure_mails.json
  def create
    files = params[:departure_mail][:files]
    @departure_mail = current_user.departure_mails.build(departure_mail_params)
    @departure_mail.status = "Enable"

    respond_to do |format|
      if @departure_mail.save
        record_activity("Créer un nouveau courrier départ (ID: #{@departure_mail.id})")

        UploadFileService.upload(files, @departure_mail,  parent_id: Folder.find(@departure_mail.folder_id).google_drive_file_id)

        format.html { redirect_to departure_mails_path, notice: 'Departure mail was successfully created.' }
        format.json { render :show, status: :created, location: @departure_mail }
      else
        format.html { render :new }
        format.json { render json: @departure_mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departure_mails/1
  # PATCH/PUT /departure_mails/1.json
  def update
    respond_to do |format|
      if @departure_mail.update(departure_mail_params)
        record_activity("Modifier un courrier départ (ID: #{@departure_mail.id})")

        format.html { redirect_to departure_mails_path, notice: 'Departure mail was successfully updated.' }
        format.json { render :show, status: :ok, location: @departure_mail }
      else
        format.html { render :edit }
        format.json { render json: @departure_mail.errors, status: :unprocessable_entity }
      end
    end
  end


  def delete
    @departure_mail = DepartureMail.find(params[:departure_mail_id])
  end

  # DELETE /departure_mails/1
  # DELETE /departure_mails/1.json
  def destroy
    @departure_mail.destroy
    respond_to do |format|
      record_activity("Supprimer un courrier départ (ID: #{@departure_mail.id})")

      format.html { redirect_to departure_mails_path, notice: 'Departure mail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_departure_mail
      @departure_mail = DepartureMail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def departure_mail_params
      params.require(:departure_mail).permit(:register_id, :internal_reference,  :departure_date,  :linked_to_mail, :reference_linked_mail, :to_answer,  :response_limit_time, :response_date, :support_id, :nature_id, :correspondent_id, :object, :description, :folder_id)
    end
end
