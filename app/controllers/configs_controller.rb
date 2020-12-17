class ConfigsController < ApplicationController
  authorize_resource
  
  before_action :authenticate_user!
  before_action :set_config, only: [:show, :edit_smtp_config, :edit, :update, :destroy]

  layout "dashboard"

  # GET /smtp_configs
  # GET /smtp_configs.json
  def index
    @configs = Config.first
  end

  # GET /smtp_configs/1
  # GET /smtp_configs/1.json
  def smtp_configs
    @config = Config.first
  end

  # GET /smtp_configs/new
  def new
    @config = Config.new
  end

  def new_smtp_config
    @config = Config.new
  end

  # GET /smtp_configs/1/edit
  def edit
  end

  def edit_smtp_config
  end
  # POST /smtp_configs
  # POST /smtp_configs.json
  def create
    @config = Config.new(config_params)

    respond_to do |format|
      if @config.save
        format.html { redirect_to @config, notice: 'Config was successfully created.' }
        format.json { render :show, status: :created, location: @config }
        format.js
      else
        format.html { render :new }
        format.json { render json: @config.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /smtp_configs/1
  # PATCH/PUT /smtp_configs/1.json
  def update
    respond_to do |format|
      if @config.update(config_params)
        format.html { redirect_to @config, notice: 'Smtp config was successfully updated.' }
        format.json { render :show, status: :ok, location: @config }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @config.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /smtp_configs/1
  # DELETE /smtp_configs/1.json
  def destroy
    @config.destroy
    respond_to do |format|
      format.html { redirect_to configs_url, notice: 'Smtp config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_config
      @config = Config.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def config_params
      params.require(:config).permit(:smtp_user_name, :smtp_user_password,  :smtp_address, :smtp_domain, :smtp_port, :smtp_authentification, :smtp_enable_starttls_auto, :smtp_ssl)
    end
end
