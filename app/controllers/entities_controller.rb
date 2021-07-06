class EntitiesController < ApplicationController

  authorize_resource
  before_action :authenticate_user!
  layout "dashboard"


  before_action :set_entity, only: [:show, :edit, :update, :destroy]

  # GET /entities
  # GET /entities.json
  def index
    @entities = Entity.all
  end

  # GET /entities/1
  # GET /entities/1.json
  def show
  end

  # GET /entities/new
  def new
    @entity_types = EntityType.all
    @entities = Entity.all
    @entity = Entity.new
  end

  # GET /entities/1/edit
  def edit
    @entity_types = EntityType.all
    @entities = Entity.all

  end

  # POST /entities
  # POST /entities.json
  def create
    @entity = current_user.entities.build(entity_params)

    respond_to do |format|
      if @entity.save
        @entities = Entity.all
        format.html { redirect_to @entity, notice: 'Entité enregistrée avec succès.' }
        format.json { render :show, status: :created, location: @entity }
        format.js
      else
        format.html { render :new }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /entities/1
  # PATCH/PUT /entities/1.json
  def update
    respond_to do |format|
      if @entity.update(entity_params)
        @entities = Entity.all
        format.html { redirect_to @entity, notice: 'Entité modifiée avec succès.' }
        format.json { render :show, status: :ok, location: @entity }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @entity = Entity.find(params[:entity_id])
  end

  # DELETE /entities/1
  # DELETE /entities/1.json
  def destroy
    @entity.destroy
    respond_to do |format|
      format.html { redirect_to entities_url, notice: 'Entité supprimé avec succès.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entity
      @entity = Entity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entity_params
      params.require(:entity).permit(:parent_entity_id, :entity_type_id, :name, :short_name, :phone, :email, :address, :description)
    end
end
