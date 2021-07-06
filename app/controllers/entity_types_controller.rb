class EntityTypesController < ApplicationController
  authorize_resource
  before_action :authenticate_user!
  layout "dashboard"
  
  before_action :set_entity_type, only: [:show, :edit, :update, :destroy]

  # GET /entity_types
  # GET /entity_types.json
  def index
    @entity_types = EntityType.all
  end

  # GET /entity_types/1
  # GET /entity_types/1.json
  def show
  end

  # GET /entity_types/new
  def new
    @entity_type = EntityType.new
  end

  # GET /entity_types/1/edit
  def edit
  end

  # POST /entity_types
  # POST /entity_types.json
  def create
    @entity_type = current_user.entity_types.build(entity_type_params)

    respond_to do |format|
      if @entity_type.save
        @entity_types = EntityType.all
        format.html { redirect_to @entity_type, notice: 'Type entité enregistré avec succès.' }
        format.json { render :show, status: :created, location: @entity_type }
        format.js
      else
        format.html { render :new }
        format.json { render json: @entity_type.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /entity_types/1
  # PATCH/PUT /entity_types/1.json
  def update
    respond_to do |format|
      if @entity_type.update(entity_type_params)
        @entity_types = EntityType.all
        format.html { redirect_to @entity_type, notice: 'Type entité modifié avec succès.' }
        format.json { render :show, status: :ok, location: @entity_type }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @entity_type.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @entity_type = EntityType.find(params[:entity_type_id])
  end


  # DELETE /entity_types/1
  # DELETE /entity_types/1.json
  def destroy
    @entity_type.destroy
    respond_to do |format|
      format.html { redirect_to entity_types_url, notice: 'Type entité supprimé avec succès.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entity_type
      @entity_type = EntityType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entity_type_params
      params.require(:entity_type).permit(:name, :description)
    end
end
