class RegisterTypesController < ApplicationController
  authorize_resource
  before_action :authenticate_user!
  layout "dashboard"
  
  before_action :set_register_type, only: [:show, :edit, :update, :destroy]

  # GET /register_types
  # GET /register_types.json
  def index
    @register_types = RegisterType.all
  end

  # GET /register_types/1
  # GET /register_types/1.json
  def show
  end

  # GET /register_types/new
  def new
    @register_type = RegisterType.new
  end

  # GET /register_types/1/edit
  def edit
  end

  # POST /register_types
  # POST /register_types.json
  def create
    @register_type = current_user.register_types.build(register_type_params)

    respond_to do |format|
      if @register_type.save
        @register_types = RegisterType.all

        format.html { redirect_to @register_type, notice: 'Type de registre enregistré avec succès.' }
        format.json { render :show, status: :created, location: @register_type }
        format.js
      else
        format.html { render :new }
        format.json { render json: @register_type.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /register_types/1
  # PATCH/PUT /register_types/1.json
  def update
    respond_to do |format|
      if @register_type.update(register_type_params)
        @register_types = RegisterType.all

        format.html { redirect_to @register_type, notice: 'Type de registre modifié avec succès.' }
        format.json { render :show, status: :ok, location: @register_type }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @register_type.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @register_type = RegisterType.find(params[:register_type_id])
  end

  # DELETE /register_types/1
  # DELETE /register_types/1.json
  def destroy
    @register_type.destroy
    respond_to do |format|
      format.html { redirect_to register_types_url, notice: 'Type de registre supprimé avec succès.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_register_type
      @register_type = RegisterType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def register_type_params
      params.require(:register_type).permit(:name, :short_name, :description)
    end
end
