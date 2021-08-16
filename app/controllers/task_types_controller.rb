class TaskTypesController < ApplicationController
  authorize_resource
  before_action :authenticate_user!
  layout "dashboard"
  
  
  before_action :set_task_type, only: [:show, :edit, :update, :destroy]

  # GET /task_types
  # GET /task_types.json
  def index
    @task_types = TaskType.order(id: :desc)
  end

  # GET /task_types/1
  # GET /task_types/1.json
  def show
  end

  # GET /task_types/new
  def new
    @task_type = TaskType.new
  end

  # GET /task_types/1/edit
  def edit
  end

  # POST /task_types
  # POST /task_types.json
  def create
    @task_type = current_user.task_types.build(task_type_params)

    respond_to do |format|
      if @task_type.save
        @task_types = TaskType.order(id: :desc)
        format.html { redirect_to @task_type, notice: 'Type de tâche enregistré avec succès.' }
        format.json { render :show, status: :created, location: @task_type }
        format.js
      else
        format.html { render :new }
        format.json { render json: @task_type.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /task_types/1
  # PATCH/PUT /task_types/1.json
  def update
    respond_to do |format|
      if @task_type.update(task_type_params)
        @task_types = TaskType.order(id: :desc)
        
        format.html { redirect_to @task_type, notice: 'Type de tâche modifié avec succès.' }
        format.json { render :show, status: :ok, location: @task_type }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @task_type.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @task_type = TaskType.find_by(uid: params[:task_type_id])
  end

  # DELETE /task_types/1
  # DELETE /task_types/1.json
  def destroy
    @task_type.destroy
    respond_to do |format|
      format.html { redirect_to task_types_url, notice: 'Type tâche supprimé avec succès.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_type
      @task_type = TaskType.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_type_params
      params.require(:task_type).permit(:name, :description)
    end
end
