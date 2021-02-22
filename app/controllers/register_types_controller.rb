class RegisterTypesController < ApplicationController
  authorize_resource
  
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
    @register_type = RegisterType.new(register_type_params)

    respond_to do |format|
      if @register_type.save
        format.html { redirect_to @register_type, notice: 'Register type was successfully created.' }
        format.json { render :show, status: :created, location: @register_type }
      else
        format.html { render :new }
        format.json { render json: @register_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /register_types/1
  # PATCH/PUT /register_types/1.json
  def update
    respond_to do |format|
      if @register_type.update(register_type_params)
        format.html { redirect_to @register_type, notice: 'Register type was successfully updated.' }
        format.json { render :show, status: :ok, location: @register_type }
      else
        format.html { render :edit }
        format.json { render json: @register_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /register_types/1
  # DELETE /register_types/1.json
  def destroy
    @register_type.destroy
    respond_to do |format|
      format.html { redirect_to register_types_url, notice: 'Register type was successfully destroyed.' }
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
      params.require(:register_type).permit(:uid, :name, :short_name, :description, :status, :user_id)
    end
end
