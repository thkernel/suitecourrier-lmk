class TaskPrioritiesController < ApplicationController
  authorize_resource
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_task_priority, only: %i[ show edit update destroy ]

  # GET /task_priorities or /task_priorities.json
  def index
    @task_priorities = TaskPriority.order(id: :desc)
  end

  # GET /task_priorities/1 or /task_priorities/1.json
  def show
  end

  # GET /task_priorities/new
  def new
    @task_priority = TaskPriority.new
  end

  # GET /task_priorities/1/edit
  def edit
  end

  # POST /task_priorities or /task_priorities.json
  def create
    @task_priority = current_user.task_priorities.build(task_priority_params)

    respond_to do |format|
      if @task_priority.save
        @task_priorities = TaskPriority.order(id: :desc)
        format.html { redirect_to @task_priority, notice: "Task priority was successfully created." }
        format.json { render :show, status: :created, location: @task_priority }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task_priority.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /task_priorities/1 or /task_priorities/1.json
  def update
    respond_to do |format|
      if @task_priority.update(task_priority_params)
        @task_priorities = TaskPriority.order(id: :desc)
        format.html { redirect_to @task_priority, notice: "Task priority was successfully updated." }
        format.json { render :show, status: :ok, location: @task_priority }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task_priority.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
      @task_priority = TaskPriority.find_by(uid: params[:task_priority_id])
    end

  # DELETE /task_priorities/1 or /task_priorities/1.json
  def destroy
    @task_priority.destroy
    respond_to do |format|
      format.html { redirect_to task_priorities_url, notice: "Task priority was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_priority
      @task_priority = TaskPriority.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_priority_params
      params.require(:task_priority).permit(:uid, :name, :color, :processing_time_in_days)
    end
end
