class TaskStatusesController < ApplicationController
  authorize_resource
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_task_status, only: [:show, :edit, :update, :destroy]

  # GET /task_statuses
  # GET /task_statuses.json
  def index
    @task_statuses = TaskStatus.order(id: :desc)
  end

  # GET /task_statuses/1
  # GET /task_statuses/1.json
  def show
  end

  # GET /task_statuses/new
  def new
    @task_status = TaskStatus.new
  end

  # GET /task_statuses/1/edit
  def edit
  end

  # POST /task_statuses
  # POST /task_statuses.json
  def create
    @task_status = current_user.task_statuses.build(task_status_params)

    respond_to do |format|
      if @task_status.save
        @task_statuses = TaskStatus.order(id: :desc)
        
        format.html { redirect_to @task_status, notice: 'Statut enregistré avec succès.' }
        format.json { render :show, status: :created, location: @task_status }
        format.js
      else
        format.html { render :new }
        format.json { render json: @task_status.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /task_statuses/1
  # PATCH/PUT /task_statuses/1.json
  def update
    respond_to do |format|
      if @task_status.update(task_status_params)
        @task_statuses = TaskStatus.order(id: :desc)

        format.html { redirect_to @task_status, notice: 'Statut modifié avec succès.' }
        format.json { render :show, status: :ok, location: @task_status }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @task_status.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @task_status = TaskStatus.find_by(uid: params[:task_status_id])
  end

  # DELETE /task_statuses/1
  # DELETE /task_statuses/1.json
  def destroy
    @task_status.destroy
    respond_to do |format|
      format.html { redirect_to task_statuses_url, notice: 'Statut supprimé avec succès.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_status
      @task_status = TaskStatus.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_status_params
      params.require(:task_status).permit(:name, :description)
    end
end
