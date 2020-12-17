class TasksController < ApplicationController
  authorize_resource
    before_action :authenticate_user!
    layout "dashboard"
  
    before_action :set_task, only: [:show, :edit, :update, :destroy]
  
    # GET /task_types
    # GET /task_types.json
    def index
      @tasks = Task.all
      record_activity("Afficher la liste des tâches.")

    end
  
    # GET /task_types/1
    # GET /task_types/1.json
    def show
    end
  
    # GET /task_types/new
    def new
      @task_types = TaskType.all
      @task = TaskType.new
    end
  
    # GET /task_types/1/edit
    def edit
      @task_types = TaskType.all
    end
  
    # POST /task_types
    # POST /task_types.json
    def create
      @task = current_user.tasks.build(task_params)
  
      respond_to do |format|
        if @task.save
          record_activity("Créer une tâche (ID: #{@task.id})")

          @tasks = TaskType.all
          format.html { redirect_to @task, notice: 'Task type was successfully created.' }
          format.json { render :show, status: :created, location: @task_type }
          format.js
        else
          format.html { render :new }
          format.json { render json: @task.errors, status: :unprocessable_entity }
          format.js
        end
      end
    end
  
    # PATCH/PUT /task_types/1
    # PATCH/PUT /task_types/1.json
    def update
      respond_to do |format|
        if @task.update(task_params)
          @tasks = Task.all
          record_activity("Modifier une tâche (ID: #{@task.id})")

          format.html { redirect_to @task, notice: 'Task type was successfully updated.' }
          format.json { render :show, status: :ok, location: @task }
          format.js
        else
          format.html { render :edit }
          format.json { render json: @task.errors, status: :unprocessable_entity }
          format.js
        end
      end
    end
  
  
    def delete
      @task = Task.find(params[:task_id])
    end
  
  
    # DELETE /task_types/1
    # DELETE /task_types/1.json
    def destroy
      @task.destroy
      @tasks = Task.all
      respond_to do |format|
        record_activity("Supprimer une tâche (ID: #{@task.id})")

        format.html { redirect_to task_url, notice: 'Task type was successfully destroyed.' }
        format.json { head :no_content }
        
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_task
        @task = Task.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def task_params
        params.require(:task).permit(:name, :task_type_id, :description)
      end
  end
  