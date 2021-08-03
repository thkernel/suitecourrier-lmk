class DocumentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  layout "dashboard"


  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
    record_activity("Afficher la liste des documents archivés.")

  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  
    #@document.drive_attachments.each do |file|
      #puts "FICHIERS: #{file.inspect}"
    #end
    #puts "LISTE DES FICHIERS"
    #UploadFileService.get_files({q: "name='Volet alarme précoce'"})
    
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


  

  # GET /documents/new
  def new
    @folders = Folder.where.not(parent_id: nil)
    @supports = Support.all 
    @natures = Nature.all
   
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
    @folders = Folder.where.not(parent_id: nil)
    @supports = Support.all 
    @natures = Nature.all

    puts "ALL TAGS: #{ActsAsTaggableOn::Tag.all.inspect}"
    @selected_tags = @document.tag_list
    puts "SELECTED: #{@selected_tags.inspect}"
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = current_user.documents.build(document_params)

    respond_to do |format|
      if @document.save
        record_activity("Créer un document (ID: #{@document.id})")

        files = params[:document][:files]
        #UploadFileService.upload(files, @document,  parent_id: Folder.find(@document.folder_id).google_drive_file_id)

        format.html { redirect_to documents_path, notice: 'Document enregistré avec succès.' }
        format.json { render :show, status: :created, location: @document }
      else
        @folders = Folder.where.not(parent_id: nil)
        @supports = Support.all 
        @natures = Nature.all
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        record_activity("Modifier un document (ID: #{@document.id})")
        files = params[:document][:files]
       # UploadFileService.upload(files, @document,  parent_id: Folder.find(@document.folder_id).google_drive_file_id)


        format.html { redirect_to documents_path, notice: 'Document modifié avec succès.' }
        format.json { render :show, status: :ok, location: @document }
      else

        @folders = Folder.where.not(parent_id: nil)
        @supports = Support.all 
        @natures = Nature.all

        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
      
        @document = Document.find_by(uid: params[:document_id])
     
    end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      record_activity("Supprimer un document (ID: #{@document.id})")

      format.html { redirect_to documents_url, notice: 'Document supprimé avec succès.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      
        @document = Document.find_by(uid: params[:id])
     
    end

    # Only allow a list of trusted parameters through.
    def document_params
      params.require(:document).permit(:support_id, :nature_id, :folder_id, :name, :description, tag_list: [], files: [])
    end
end
