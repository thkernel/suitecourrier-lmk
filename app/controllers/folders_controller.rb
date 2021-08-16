class FoldersController < ApplicationController
  authorize_resource
 # Include shared utils.
 include SharedUtils::Folder


 
  before_action :authenticate_user!
  layout "dashboard"


  before_action :set_folder, only: [:show, :edit, :update, :destroy]

  # GET /folders
  # GET /folders.json
  def index
    #@folders = Folder.all
    @folders = Folder.where(parent_id: nil).order(id: :desc)
    record_activity("Afficher la liste des dossiers.")

  end

  # GET /folders/1
  # GET /folders/1.json
  def show
  end

  def download_drive_file 
    file_id = params[:key]
    puts "FileID: #{file_id}"
    $drive.download_file(file_id, file_name: DriveBlob.find_by(key: file_id).filename )
   
    download_file("#{Dir.tmpdir}/#{DriveBlob.find_by(key: file_id).filename}", DriveBlob.find_by(key: file_id).content_type)

  end


  def last_folder
    last_folder = Folder.last
    folders = Folder.all
    data = {:last_record => last_folder, :all_records => folders}
    render :json => data
  end

  

  # GET /folders/new
  def new
   
    @folders = Folder.where(parent_id: nil)
    @folder = Folder.new
    #@folder = current_user.folders.new     
    #if there is "folder_id" param, we know that we are under a folder, thus, we will essentially create a subfolder 
    #if params[:uid] #if we want to create a folder inside another folder 
        
      #we still need to set the @current_folder to make the buttons working fine 
      #@current_folder = current_user.folders.find_by(uid: params[:uid]) 
        
      #then we make sure the folder we are creating has a parent folder which is the @current_folder 
      #@folder.parent_id = @current_folder.id 
    #end

  end

  # GET /folders/1/edit
  def edit
    @folders = Folder.where(parent_id: nil)
  end

  def last_folder
    last_folder = Folder.last
    folders = Folder.all
    data = {:last_record => last_folder, :all_records => folders}
    render :json => data
  end


  

  #this action is for viewing folders 
def browse 
  #get the folders owned/created by the current_user 
  @current_folder = current_user.folders.find_by(uid: params[:uid])   

  if @current_folder
  
    #getting the folders which are inside this @current_folder 
    @folders = @current_folder.children 

  
    render :action => "index"
  else
    flash[:error] = "Don't be cheeky! Mind your own folders!"
    redirect_to root_url 
  end
end

def create_file
  #file_id = $drive.create_file("certificat.pdf", parent_id: "1DpHMensr3pGRGsC6UV3Ltf2dU9Qgpftb")
  #puts "CREATED: #{file_id}"
  #file_id = $drive.upload_file("ruby.rb", parent_id: "1DpHMensr3pGRGsC6UV3Ltf2dU9Qgpftb", path: "/home/thekernel/ruby.rb")
  file_id = $drive.download_file("1dQoPGomAAIgIFiQk5CAFU0R62tjUXxe0", file_name: DriveBlob.find_by(key: "1dQoPGomAAIgIFiQk5CAFU0R62tjUXxe0").filename )

  
  puts "FILE: #{file_id.inspect}"
  
end
  # POST /folders
  # POST /folders.json
  def create
    @folder = current_user.folders.build(folder_params)

    @folder.name = folder_params[:name].upcase
   

    respond_to do |format|
      if @folder.save
        
        record_activity("Créer un nouveau dossier (ID: #{@folder.id})")

        #if @folder.parent_id #checking if we have a parent folder on this one 
          
          #Thread.new do
            #Rails.application.executor.wrap do
              #file_id = $drive.create_folder(@folder.name.upcase, parent_id: @folder.parent.google_drive_file_id)
              # Update google drive file ID
              #@folder.update_column(:google_drive_file_id, file_id.id)
           # end
          #end

           
            
          format.html { redirect_to browse_path(uid: Folder.find(@folder.parent_id).uid), notice: 'Folder was successfully created.' }
          format.json { render :show, status: :created, location: @folder }
          format.js
          
        else

          #Thread.new do
           # Rails.application.executor.wrap do
              #file_id = $drive.create_folder(@folder.name.upcase)
              # Update google drive file ID
              #@folder.update_column(:google_drive_file_id, file_id.id)
            #end
          #end
          



          format.html { redirect_to folders_path, notice: 'Dossier crée avec succès.' }
          format.json { render :show, status: :created, location: @folder }
          format.js
        end
      else
        
        format.html { render :new }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
        format.js
      end
    end

    @folders = Folder.where(parent_id: nil).order(id: :desc)
  end

  # PATCH/PUT /folders/1
  # PATCH/PUT /folders/1.json
  def update
    #@parent_folder = @folder.parent 
    respond_to do |format|
      if @folder.update(folder_params)
        record_activity("Modifier un dossier (ID: #{@folder.id})")
          @folders = Folder.order(id: :desc)
        
          format.html { redirect_to folders_path, notice: 'Dossier modifié avec succès.' }
          format.json { head :no_content }
        
      end
    end
  end


  def delete
    @folder = Folder.find_by(uid: params[:folder_id])
  end



  # DELETE /folders/1
  # DELETE /folders/1.json
  def destroy
    #@folder = current_user.folders.find_by(uid: params[:id]) 
    #@parent_folder = @folder.parent #grabbing the parent folder 
  
   @folder.destroy 
  

    respond_to do |format|
      record_activity("Supprimer un dossier (ID: #{@folder.id})")

      #Thread.new do
          #Rails.application.executor.wrap do
            #$drive.delete(@folder.google_drive_file_id) 
          #end
        #end
      

      
        format.html { redirect_to folders_path, notice: 'Dossier supprimé avec succès.' }
        format.json { head :no_content }
      
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_folder
      
        @folder = Folder.find_by(uid: params[:id])
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def folder_params
      params.require(:folder).permit(:name, :parent_id)
    end

    def download_file(file, content_type)
      #send_file file, :type => 'text/xml; charset=UTF-8;', :disposition => 'attachment'

      send_file file, :type => content_type, :disposition => 'attachment'
    end

end
