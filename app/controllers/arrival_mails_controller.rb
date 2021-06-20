class ArrivalMailsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_arrival_mail, only: [:show, :edit, :update, :destroy, :to_archive]
  layout "dashboard"


  # GET /arrival_mails
  # GET /arrival_mails.json
  def index

    @current_user_arrival_mails = current_user.arrival_mails
    @imputations = Imputation.where(imputable_type: "ArrivalMail").where("recipient_id = ? OR user_id = ?", current_user.id, current_user.id)


    #@arrival_mails = ArrivalMail.where.not(status: "Archived")
    record_activity("Afficher la liste des courriers arrivées")

  end

  # GET /arrival_mails/1
  # GET /arrival_mails/1.json
  def show
  end


  def get_natures
    @natures = Nature.all.map { |nature| [nature.name, nature.id] }#.insert(0, "Sélectionner")
    
    #respond_to do |format|
     
        #format.json { render :show, status: :created, location: @arrival_mail }
    #end
    #@natures = Nature.where("name ILIKE ?", "%#{params[:term]}%").map{|item| {:id=>item.id,:text => item.name}}

  end

  def get_supports
    @supports = Support.all.map { |support| [support.name, support.id] } 
  end
  
  def get_folders
    @folders = Folder.all.map { |folder| [folder.name, folder.id] } 
  end

  def get_correspondents
    @correspondents = Correspondent.all.map { |correspondent| [correspondent.correspondent_name, correspondent.id] } 
  end

  def archive
    @arrival_mail = ArrivalMail.find(params[:arrival_mail_id])
  end

  def to_archive

    respond_to do |format|
      if @arrival_mail.update_column(:status, "Archived")
  
        @arrival_mails = ArrivalMail.where.not(status: "Archived")

        format.html { redirect_to arrival_mails_path, notice: 'Arrival mail was successfully created.' }
        format.json { render :show, status: :created, location: @arrival_mail }
        format.js
      else
        format.html { render :new }
        format.json { render json: @arrival_mail.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def archives
    @arrival_mails = ArrivalMail.where(status: "Archived")
  end

  def bulk_archive_modal
  end

  def bulk_archive
    receipt_date = params[:receipt_date]
    puts "ARRIVAL DATE: #{receipt_date}"
    arrival_mails = ArrivalMail.where(receipt_date: receipt_date)

    respond_to do |format|
      if arrival_mails.present?
        if arrival_mails.update_all(status: "Archived")
    

          format.html { redirect_to arrival_mails_archives_path, notice: 'Arrival mail was successfully created.' }
          format.json { render :show, status: :created, location: @arrival_mail }
          format.js
        end
      else
        format.html { redirect_to arrival_mails_archives_path, notice: 'Arrival mail was successfully created.' }
        format.json { render json: @arrival_mail.errors, status: :unprocessable_entity }
        format.js
      end
    end 
  end
  
  # GET /arrival_mails/new
  def new
   
    
      
    @internal_reference = last_arrival_mail
   
    
    @arrival_mail = ArrivalMail.new
    
    @registers = Register.where("status = ? AND register_type_id = ?", "Ouvert", RegisterType.find_by(name: "COURRIER D'ARRIVÉE").id)
    
    @natures = Nature.all 
    @supports = Support.all
    @folders = Folder.where.not(parent_id: nil)
    @correspondents = Correspondent.all
    #@last_arrival_mail = ArrivalMail.last(1)
  end

  # GET /arrival_mails/1/edit
  def edit
    
    @registers = Register.where("status = ? AND register_type_id = ?", "Ouvert", RegisterType.find_by(name: "COURRIER D'ARRIVÉE").id)
    
    @natures = Nature.all 
    @supports = Support.all
    @folders = Folder.where.not(parent_id: nil)
    @correspondents = Correspondent.all
  end

  # POST /arrival_mails
  # POST /arrival_mails.json
  def create
    files = params[:arrival_mail][:files]
    #puts "FILES: #{files.inspect}"
    
   

    @arrival_mail = current_user.arrival_mails.build(arrival_mail_params)
    @arrival_mail.status = "Enable"

    if @arrival_mail.response_date.present?
      @arrival_mail.status = "Répondu"
    end
    
    @arrival_mail.year = Time.now.year
    
    respond_to do |format|
      if @arrival_mail.save
        record_activity("Créer un courrier arrivée (ID: #{@arrival_mail.id})")
        #files = params[:arrival_mail][:files]

        #UploadFileService.upload(files, @arrival_mail,  parent_id: Folder.find(@arrival_mail.folder_id).google_drive_file_id)
        
        @arrival_mails = ArrivalMail.where.not(status: "Archived")

        format.html { redirect_to arrival_mails_path, notice: 'Arrival mail was successfully created.' }
        format.json { render :show, status: :created, location: @arrival_mail }
        format.js
      else
        @registers = Register.where("status = ? AND register_type_id = ?", "Ouvert", RegisterType.find_by(name: "COURRIER D'ARRIVÉE").id)

    
        @natures = Nature.all 
        @supports = Support.all
        @folders = Folder.where.not(parent_id: nil)
        @correspondents = Correspondent.all

        format.html { render :new }
        format.json { render json: @arrival_mail.errors, status: :unprocessable_entity }
        format.js
      end
    end

   
  end

  # PATCH/PUT /arrival_mails/1
  # PATCH/PUT /arrival_mails/1.json
  def update
    respond_to do |format|
      if @arrival_mail.update(arrival_mail_params)
        record_activity("Modifier un courrier arrivée (ID: #{@arrival_mail.id})")
        files = params[:arrival_mail][:files]

        #UploadFileService.upload(files, @arrival_mail,  parent_id: Folder.find(@arrival_mail.folder_id).google_drive_file_id)

        @arrival_mails = ArrivalMail.where.not(status: "Archived")

        format.html { redirect_to arrival_mails_path, notice: 'Arrival mail was successfully updated.' }
        format.json { render :show, status: :ok, location: @arrival_mail }
        format.js
      else

        @natures = Nature.all 
        @supports = Support.all
        @folders = Folder.where.not(parent_id: nil)
        @correspondents = Correspondent.all

        format.html { render :edit }
        format.json { render json: @arrival_mail.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @arrival_mail = ArrivalMail.find(params[:arrival_mail_id])
  end



  # DELETE /arrival_mails/1
  # DELETE /arrival_mails/1.json
  def destroy
    @arrival_mail.destroy
    @arrival_mails = ArrivalMail.where.not(status: "Archived")

    respond_to do |format|
      record_activity("Supprimer un courrier arrivée (ID: #{@arrival_mail.id})")

      format.html { redirect_to arrival_mails_url, notice: 'Arrival mail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arrival_mail
      if params[:id]
        @arrival_mail = ArrivalMail.find(params[:id])
      elsif params[:uid]
        @arrival_mail = ArrivalMail.find_by(uid: params[:uid])
      end
    end

   

    # Never trust parameters from the scary internet, only allow the white list through.
    def arrival_mail_params
      params.require(:arrival_mail).permit(:register_id, :internal_reference, :external_reference, :departure_date, :receipt_date, :linked_to_mail, :reference_linked_mail, :to_answer,  :response_limit_time, :response_date, :support_id, :nature_id, :correspondent_id, :object, :description, :folder_id, files: [])
    end
end
