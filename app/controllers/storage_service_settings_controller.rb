class StorageServiceSettingsController < ApplicationController
  before_action :set_storage_service_setting, only: %i[ show edit update destroy ]

  # GET /storage_service_settings or /storage_service_settings.json
  def index
    @storage_service_settings = StorageServiceSetting.all
  end

  # GET /storage_service_settings/1 or /storage_service_settings/1.json
  def show
  end

  # GET /storage_service_settings/new
  def new
    @storage_service_setting = StorageServiceSetting.new
  end

  # GET /storage_service_settings/1/edit
  def edit

    storage_services = @storage_service_setting.storage_services

    @selected_storage_services = storage_services unless storage_services.blank?
  end

  # POST /storage_service_settings or /storage_service_settings.json
  def create
    @storage_service_setting = StorageServiceSetting.new(storage_service_setting_params)

    respond_to do |format|
      if @storage_service_setting.save
        format.html { redirect_to @storage_service_setting, notice: "Storage service setting was successfully created." }
        format.json { render :show, status: :created, location: @storage_service_setting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @storage_service_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /storage_service_settings/1 or /storage_service_settings/1.json
  def update
    respond_to do |format|
      if @storage_service_setting.update(storage_service_setting_params)
        format.html { redirect_to @storage_service_setting, notice: "Storage service setting was successfully updated." }
        format.json { render :show, status: :ok, location: @storage_service_setting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @storage_service_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storage_service_settings/1 or /storage_service_settings/1.json
  def destroy
    @storage_service_setting.destroy
    respond_to do |format|
      format.html { redirect_to storage_service_settings_url, notice: "Storage service setting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_storage_service_setting
      @storage_service_setting = StorageServiceSetting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def storage_service_setting_params
      params.require(:storage_service_setting).permit(:local_storage_service, :local_storage_root, :amazon_storage_service_name, :amazon_storage_access_key_id, :amazon_storage_secret_access_key, :amazon_storage_region_name, :amazon_storage_bucket_name, :google_storage_service_name, :google_storage_project_name, :google_storage_credentials, :google_storage_bucket_name, :microsoft_storage_service_name, :microsoft_storage_account_name, :microsoft_storage_access_key, :microsoft_storage_container_name, :user_id)
    end
end
