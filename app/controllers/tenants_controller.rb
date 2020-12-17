class TenantsController < ApplicationController
  # Include shared utils.
  include SharedUtils::Folder


  before_action :authenticate_user!
  layout "dashboard"
  
  before_action :set_tenant, only: [:show, :edit, :update, :destroy]

  # GET /tenants
  # GET /tenants.json
  def index
    @tenants = Tenant.all
  end

  # GET /tenants/1
  # GET /tenants/1.json
  def show
  end

  # GET /tenants/new
  def new
    @tenant = Tenant.new
  end

  # GET /tenants/1/edit
  def edit
  end

  # POST /tenants
  # POST /tenants.json
  def create
    @tenant = current_user.tenants.build(tenant_params)

    respond_to do |format|
      if @tenant.save
        @tenants = Tenant.all


        create_folder( OutinStorage.configuration.path + @tenant.domain.downcase)

        format.html { redirect_to @tenant, notice: 'Tenant was successfully created.' }
        format.json { render :show, status: :created, location: @tenant }
        format.js
      else
        format.html { render :new }
        format.json { render json: @tenant.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /tenants/1
  # PATCH/PUT /tenants/1.json
  def update
    respond_to do |format|
      if @tenant.update(tenant_params)
        @tenants = Tenant.all

        format.html { redirect_to @tenant, notice: 'Tenant was successfully updated.' }
        format.json { render :show, status: :ok, location: @tenant }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @tenant.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @tenant = Tenant.find(params[:tenant_id])
  end


  # DELETE /tenants/1
  # DELETE /tenants/1.json
  def destroy
    @tenant.destroy
    Apartment::Tenant.drop(@tenant.domain.downcase) 
    @tenants = Tenant.all

    respond_to do |format|
      format.html { redirect_to tenants_url, notice: 'Tenant was successfully destroyed.' }
      format.json { head :no_content }
      
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenant
      @tenant = Tenant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tenant_params
      params.require(:tenant).permit(:name, :domain)
    end
end
