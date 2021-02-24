class GeneralSettingsController < ApplicationController
  before_action :set_general_setting, only: [:show, :edit, :update, :destroy]

  # GET /general_settings
  # GET /general_settings.json
  def index
    @general_settings = GeneralSetting.all
  end

  # GET /general_settings/1
  # GET /general_settings/1.json
  def show
  end

  # GET /general_settings/new
  def new
    @general_setting = GeneralSetting.new
  end

  # GET /general_settings/1/edit
  def edit
  end

  # POST /general_settings
  # POST /general_settings.json
  def create
    @general_setting = GeneralSetting.new(general_setting_params)

    respond_to do |format|
      if @general_setting.save
        format.html { redirect_to configurations_path, notice: 'General setting was successfully created.' }
        format.json { render :show, status: :created, location: @general_setting }
      else
        format.html { render :new }
        format.json { render json: @general_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /general_settings/1
  # PATCH/PUT /general_settings/1.json
  def update
    respond_to do |format|
      if @general_setting.update(general_setting_params)
        format.html { redirect_to configurations_path, notice: 'General setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @general_setting }
      else
        format.html { render :edit }
        format.json { render json: @general_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /general_settings/1
  # DELETE /general_settings/1.json
  def destroy
    @general_setting.destroy
    respond_to do |format|
      format.html { redirect_to general_settings_url, notice: 'General setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_general_setting
      @general_setting = GeneralSetting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def general_setting_params
      params.require(:general_setting).permit(:application_name, :login_screen_message, :home_screen_message, :logo, :wallpaper, :user_id)
    end
end
