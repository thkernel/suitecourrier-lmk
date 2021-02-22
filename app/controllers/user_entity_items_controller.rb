class UserEntityItemsController < ApplicationController
  before_action :set_user_entity_item, only: [:show, :edit, :update, :destroy]

  # GET /user_entity_items
  # GET /user_entity_items.json
  def index
    @user_entity_items = UserEntityItem.all
  end

  # GET /user_entity_items/1
  # GET /user_entity_items/1.json
  def show
  end

  # GET /user_entity_items/new
  def new
    @user_entity_item = UserEntityItem.new
  end

  # GET /user_entity_items/1/edit
  def edit
  end

  # POST /user_entity_items
  # POST /user_entity_items.json
  def create
    @user_entity_item = UserEntityItem.new(user_entity_item_params)

    respond_to do |format|
      if @user_entity_item.save
        format.html { redirect_to @user_entity_item, notice: 'User entity item was successfully created.' }
        format.json { render :show, status: :created, location: @user_entity_item }
      else
        format.html { render :new }
        format.json { render json: @user_entity_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_entity_items/1
  # PATCH/PUT /user_entity_items/1.json
  def update
    respond_to do |format|
      if @user_entity_item.update(user_entity_item_params)
        format.html { redirect_to @user_entity_item, notice: 'User entity item was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_entity_item }
      else
        format.html { render :edit }
        format.json { render json: @user_entity_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_entity_items/1
  # DELETE /user_entity_items/1.json
  def destroy
    @user_entity_item.destroy
    respond_to do |format|
      format.html { redirect_to user_entity_items_url, notice: 'User entity item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_entity_item
      @user_entity_item = UserEntityItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_entity_item_params
      params.require(:user_entity_item).permit(:user_entity_id, :entity_id, :status)
    end
end
