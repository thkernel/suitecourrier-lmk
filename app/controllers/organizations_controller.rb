class OrganizationsController < ApplicationController
  authorize_resource
  before_action :authenticate_user!
  before_action :set_organization, only: [:show, :edit, :update, :destroy]
  layout "dashboard"
  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.order(id: :desc)
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    
  end

  # GET /organizations/new
  def new
    @organization_types = OrganizationType.all
    @organization = Organization.new
   
  end

  def setup
    @organization_types = OrganizationType.all
    @organization = Organization.new
    render layout: "setup"
  end
  

  # GET /organizations/1/edit
  def edit
    @organization_types = OrganizationType.all
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = current_user.build_organization(organization_params)

    respond_to do |format|
      if @organization.save
        record_activity("Créer une organisation (ID: #{@organization.id})")

        format.html { redirect_to show_organization_path(@organization.uid), notice: 'Organisation crée avec succès.' }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        record_activity("Modifier une organisation (ID: #{@organization.id})")

        format.html { redirect_to show_organization_path(@organization.uid), notice: 'Organisation modifiée avec succès.' }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
    respond_to do |format|
      record_activity("Supprimer une organisation (ID: #{@organization.id})")

      format.html { redirect_to organizations_url, notice: 'Organisation supprimée avec succès.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      
        @organization = Organization.find_by(uid: params[:id])
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:name, :organization_type_id, :slogan, :address,  :city,  :country, :phone, :web_site, :zip_code, :fax, :logo)
    end
end
