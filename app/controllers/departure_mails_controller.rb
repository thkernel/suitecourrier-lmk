class DepartureMailsController < ApplicationController
  authorize_resource
  before_action :authenticate_user!
  layout "dashboard"
  
  before_action :set_departure_mail, only: [:show, :edit, :update, :destroy, :to_archive]

  # GET /departure_mails
  # GET /departure_mails.json
  def index
    @departure_mails = DepartureMail.order(id: :desc)
    #@departure_mails = DepartureMail.where.not(status: "Archived")
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
    @departure_mail = DepartureMail.find(params[:departure_mail_id])
  end

  def to_archive

    respond_to do |format|
      if @departure_mail.update_column(:status, "Archived")
  

        format.html { redirect_to departure_mails_path, notice: 'Courrier archivé avec succès.' }
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

  def get_initiators
    if params[:id].present?
      entity = Entity.find(params[:id])
      puts "ENTITY: #{entity.inspect}"


      role_ids = Role.where("name NOT IN (?)", ["superuser", "root", "demo"]).map {|role| role.id}
      user_ids = User.where("role_id  IN (?)", role_ids).map {|user| user.id}
    
      @recipients = Profile.where("user_id  IN (?) AND entity_id = ?", user_ids, entity.id)
    

      puts "RECIPIENT: #{@recipients}"
    end
  end

  def get_processing_recipients
    if params[:id].present?
      entity = Entity.find(params[:id])
      puts "ENTITY: #{entity.inspect}"


      role_ids = Role.where("name NOT IN (?)", ["superuser", "root", "demo"]).map {|role| role.id}
      user_ids = User.where("role_id  IN (?)", role_ids).map {|user| user.id}
    
      @recipients = Profile.where("user_id  IN (?) AND entity_id = ?", user_ids, entity.id)
    

      puts "RECIPIENT: #{@recipients}"
    end
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

    
    
      
      @internal_reference = last_departure_mail
    
    
    @departure_mail = DepartureMail.new
   
    
   
    @registers = Register.where("status = ? AND register_type_id = ?", "Ouvert", RegisterType.find_by(name: "Registre départ").id)
    
    @natures = Nature.all 
    @supports = Support.all
    @folders = Folder.where.not(parent_id: nil)
    @correspondents = Correspondent.all
    @mail_types = MailType.all 
    @mail_categories = MailCategory.all 
    @mail_priorities = MailPriority.all 
    @mail_statuses = MailStatus.all
    @entities = Entity.all


    role_ids = Role.where("name NOT IN (?)", ["superuser"]).map {|role| role.id}
    @recipients = User.where("role_id  IN (?)", role_ids).map {|user| user.profile}


  end

  # GET /departure_mails/1/edit
  def edit
    @registers = Register.where("status = ? AND register_type_id = ?", "Ouvert", RegisterType.find_by(name: "Registre départ").id)
    @natures = Nature.all 
    @supports = Support.all
    @folders = Folder.where.not(parent_id: nil)
    @correspondents = Correspondent.all
    @mail_types = MailType.all 
    @mail_categories = MailCategory.all 
    @mail_priorities = MailPriority.all 
    @mail_statuses = MailStatus.all
    @entities = Entity.all

    role_ids = Role.where("name NOT IN (?)", ["superuser"]).map {|role| role.id}
    @recipients = User.where("role_id  IN (?)", role_ids).map {|user| user.profile}


  end

  # POST /departure_mails
  # POST /departure_mails.json
  def create
    files = params[:departure_mail][:files]
    @departure_mail = current_user.departure_mails.build(departure_mail_params)
    #@departure_mail.status = "Enable"

    @departure_mail.year = Time.now.year

    respond_to do |format|
      if @departure_mail.save
        record_activity("Créer un nouveau courrier départ (ID: #{@departure_mail.id})")

        #UploadFileService.upload(files, @departure_mail,  parent_id: Folder.find(@departure_mail.folder_id).google_drive_file_id)

        format.html { redirect_to departure_mails_path, notice: 'Courrier départ enregistré avec succès.' }
        format.json { render :show, status: :created, location: @departure_mail }
      else

        @registers = Register.where("status = ? AND register_type_id = ?", "Ouvert", RegisterType.find_by(name: "Registre départ").id)
        @natures = Nature.all 
        @supports = Support.all
        @folders = Folder.where.not(parent_id: nil)
        @correspondents = Correspondent.all
        @mail_types = MailType.all 
        @mail_categories = MailCategory.all 
        @mail_priorities = MailPriority.all 
        @mail_statuses = MailStatus.all
        @entities = Entity.all

        role_ids = Role.where("name NOT IN (?)", ["superuser"]).map {|role| role.id}
        @recipients = User.where("role_id  IN (?)", role_ids).map {|user| user.profile}

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

        format.html { redirect_to departure_mails_path, notice: 'Courrier modifié avec succès.' }
        format.json { render :show, status: :ok, location: @departure_mail }
      else
        @registers = Register.where("status = ? AND register_type_id = ?", "Ouvert", RegisterType.find_by(name: "Registre départ").id)
        @natures = Nature.all 
        @supports = Support.all
        @folders = Folder.where.not(parent_id: nil)
        @correspondents = Correspondent.all
        @mail_types = MailType.all 
        @mail_categories = MailCategory.all 
        @mail_priorities = MailPriority.all 
        @mail_statuses = MailStatus.all
        @entities = Entity.all


        role_ids = Role.where("name NOT IN (?)", ["superuser"]).map {|role| role.id}
        @recipients = User.where("role_id  IN (?)", role_ids).map {|user| user.profile}

        
        format.html { render :edit }
        format.json { render json: @departure_mail.errors, status: :unprocessable_entity }
      end
    end
  end


  def delete
    @departure_mail = DepartureMail.find_by(uid: params[:departure_mail_id])
  end

  # DELETE /departure_mails/1
  # DELETE /departure_mails/1.json
  def destroy
    @departure_mail.destroy
    respond_to do |format|
      record_activity("Supprimer un courrier départ (ID: #{@departure_mail.id})")

      format.html { redirect_to departure_mails_path, notice: 'Courrier supprimé avec succès.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_departure_mail
      
        @departure_mail = DepartureMail.find_by(uid: params[:id])
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def departure_mail_params
      params.require(:departure_mail).permit(:register_id, :internal_reference,  :departure_date,  :linked_to_mail, :reference_linked_mail, :to_answer,  :response_limit_time, :response_date, :support_id, :nature_id, :correspondent_id, :object, :mail_type_id, :mail_status_id, :mail_category_id, :mail_priority_id, :initiating_entity_id, :initiator_id, :processing_entity_id, :processing_recipient_id, :processing_deadline, :folder_id, files: [])
    end
end
