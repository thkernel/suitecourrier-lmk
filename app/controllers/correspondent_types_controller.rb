class CorrespondentTypesController < ApplicationController
  authorize_resource
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_correspondent_type, only: [:show, :edit, :update, :destroy]

  # GET /correspondent_types
  # GET /correspondent_types.json
  def index
    @correspondent_types = CorrespondentType.all
    record_activity("Afficher la liste des types correspondant (ID: #{@correspondent_type.id})")

  end

  # GET /correspondent_types/1
  # GET /correspondent_types/1.json
  def show
  end

  # GET /correspondent_types/new
  def new
    @correspondent_type = CorrespondentType.new
  end

  # GET /correspondent_types/1/edit
  def edit
  end

  # POST /correspondent_types
  # POST /correspondent_types.json
  def create
    @correspondent_type = current_user.correspondent_types.build(correspondent_type_params)

    respond_to do |format|
      if @correspondent_type.save
        record_activity("Créer un nouveau type de correspondant (ID: #{@correspondent_type.id})")

        @correspondent_types = CorrespondentType.all

        format.html { redirect_to @correspondent_type, notice: 'Correspondent type was successfully created.' }
        format.json { render :show, status: :created, location: @correspondent_type }
        format.js
      else
        format.html { render :new }
        format.json { render json: @correspondent_type.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /correspondent_types/1
  # PATCH/PUT /correspondent_types/1.json
  def update
    respond_to do |format|
      if @correspondent_type.update(correspondent_type_params)
        record_activity("Modifier un type de correspondant (ID: #{@correspondent_type.id})")

        @correspondent_types = CorrespondentType.all

        format.html { redirect_to @correspondent_type, notice: 'Correspondent type was successfully updated.' }
        format.json { render :show, status: :ok, location: @correspondent_type }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @correspondent_type.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @correspondent_type = CorrespondentType.find(params[:correspondent_type_id])
  end

  # DELETE /correspondent_types/1
  # DELETE /correspondent_types/1.json
  def destroy
    @correspondent_type.destroy
    @correspondent_types = CorrespondentType.all

    respond_to do |format|
      record_activity("Supprimer un type de correspondant (ID: #{@correspondent_type.id})")

      format.html { redirect_to correspondent_types_url, notice: 'Correspondent type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_correspondent_type
      @correspondent_type = CorrespondentType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def correspondent_type_params
      params.require(:correspondent_type).permit(:name, :description)
    end
end
