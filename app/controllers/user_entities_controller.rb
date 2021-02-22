class UserEntitiesController < ApplicationController
  before_action :set_user_entity, only: [:show, :edit, :update, :destroy]

  # GET /user_entities
  # GET /user_entities.json
  def index
    @user_entities = UserEntity.all
  end

  # GET /user_entities/1
  # GET /user_entities/1.json
  def show
  end

  # GET /user_entities/new
  def new
    @user_entity = UserEntity.new
  end

  # GET /user_entities/1/edit
  def edit
  end

  # POST /user_entities
  # POST /user_entities.json
  def create
    @user_entity = UserEntity.new(user_entity_params)

    respond_to do |format|
      if @user_entity.save
        format.html { redirect_to @user_entity, notice: 'User entity was successfully created.' }
        format.json { render :show, status: :created, location: @user_entity }
      else
        format.html { render :new }
        format.json { render json: @user_entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_entities/1
  # PATCH/PUT /user_entities/1.json
  def update
    respond_to do |format|
      if @user_entity.update(user_entity_params)
        format.html { redirect_to @user_entity, notice: 'User entity was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_entity }
      else
        format.html { render :edit }
        format.json { render json: @user_entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_entities/1
  # DELETE /user_entities/1.json
  def destroy
    @user_entity.destroy
    respond_to do |format|
      format.html { redirect_to user_entities_url, notice: 'User entity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_entity
      @user_entity = UserEntity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_entity_params
      params.require(:user_entity).permit(:user_id, :status)
    end
end
