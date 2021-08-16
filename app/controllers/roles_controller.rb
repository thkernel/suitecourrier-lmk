class RolesController < ApplicationController
  authorize_resource
  before_action :authenticate_user!
  before_action :set_role, only: [:show, :edit, :update, :destroy]
  layout "dashboard"
  # GET /roles
  # GET /roles.json
  def index
    @roles = Role.order(id: :desc)
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
  end

  # GET /roles/new
  def new
    @role = Role.new
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(role_params)

    respond_to do |format|
      if @role.save
        @roles = Role.order(id: :desc)
        format.html { redirect_to @role, notice: 'Rôle enregistré avec succès.' }
        format.json { render :show, status: :created, location: @role }
        format.js
      else
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    respond_to do |format|
      if @role.update(role_params)
        @roles = Role.order(id: :desc)
        format.html { redirect_to @role, notice: 'Rôle modifié avec succès.' }
        format.json { render :show, status: :ok, location: @role }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end


  def delete
    @role = Role.find_by(uid: params[:role_id])
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to roles_url, notice: 'Rôle supprimé avec succès.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def role_params
      params.require(:role).permit(:name, :description, :status)
    end
end
