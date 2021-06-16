class StorageServicesController < ApplicationController
  before_action :set_storage_service, only: %i[ show edit update destroy ]

  # GET /storage_services or /storage_services.json
  def index
    @storage_services = StorageService.all
  end

  # GET /storage_services/1 or /storage_services/1.json
  def show
  end

  # GET /storage_services/new
  def new
    @storage_service = StorageService.new
  end

  # GET /storage_services/1/edit
  def edit
  end

  # POST /storage_services or /storage_services.json
  def create
    @storage_service = StorageService.new(storage_service_params)

    respond_to do |format|
      if @storage_service.save
        format.html { redirect_to @storage_service, notice: "Storage service was successfully created." }
        format.json { render :show, status: :created, location: @storage_service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @storage_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /storage_services/1 or /storage_services/1.json
  def update
    respond_to do |format|
      if @storage_service.update(storage_service_params)
        format.html { redirect_to @storage_service, notice: "Storage service was successfully updated." }
        format.json { render :show, status: :ok, location: @storage_service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @storage_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storage_services/1 or /storage_services/1.json
  def destroy
    @storage_service.destroy
    respond_to do |format|
      format.html { redirect_to storage_services_url, notice: "Storage service was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_storage_service
      @storage_service = StorageService.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def storage_service_params
      params.require(:storage_service).permit(:storage_service_name, :storage_service_setting_id)
    end
end
