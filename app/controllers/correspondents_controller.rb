class CorrespondentsController < ApplicationController
  authorize_resource
  before_action :authenticate_user!
  layout "dashboard"


  before_action :set_correspondent, only: [:show, :edit, :update, :destroy]

  # GET /correspondents
  # GET /correspondents.json
  def index
    @correspondents = Correspondent.all
  end

  # GET /correspondents/1
  # GET /correspondents/1.json
  def show
  end

  # GET /correspondents/new
  def new
    @correspondent = Correspondent.new
    @correspondent_types = CorrespondentType.all
  end

  # GET /correspondents/1/edit
  def edit
    @correspondent_types = CorrespondentType.all
  end

  def last_correspondent
    last_correspondent = Correspondent.last
    correspondents = Correspondent.all
    data = {:last_record => last_correspondent, :all_records => correspondents}
    render :json => data
  end
  

  # POST /correspondents
  # POST /correspondents.json
  def create
    @correspondent = current_user.correspondents.build(correspondent_params)

    respond_to do |format|
      if @correspondent.save
        @correspondents = Correspondent.all
        format.html { redirect_to @correspondent, notice: 'Correspondant enregistré avec succès.' }
        format.json { render :show, status: :created, location: @correspondent }
        format.js
      else
        format.html { render :new }
        format.json { render json: @correspondent.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /correspondents/1
  # PATCH/PUT /correspondents/1.json
  def update
    respond_to do |format|
      if @correspondent.update(correspondent_params)
        @correspondents = Correspondent.all
        format.html { redirect_to @correspondent, notice: 'Correspondant modifié avec succès.' }
        format.json { render :show, status: :ok, location: @correspondent }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @correspondent.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @correspondent = Correspondent.find(params[:correspondent_id])
  end

  # DELETE /correspondents/1
  # DELETE /correspondents/1.json
  def destroy
    @correspondent.destroy
    @correspondents = Correspondent.all
    respond_to do |format|
      format.html { redirect_to correspondents_url, notice: 'Correspondant supprimé avec succès.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_correspondent
      @correspondent = Correspondent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def correspondent_params
      params.require(:correspondent).permit(:organization_name, :contact_first_name, :contact_last_name, :address, :phone, :city, :country, :email, :zip_code, :contact_phone, :contact_email, :correspondent_type_id)
    end
end
