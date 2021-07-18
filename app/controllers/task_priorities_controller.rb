class TaskPrioritiesController < ApplicationController
  before_action :set_task_priority, only: %i[ show edit update destroy ]

  # GET /task_priorities or /task_priorities.json
  def index
    @task_priorities = TaskPriority.all
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
    @task_priority = TaskPriority.new(task_priority_params)

    respond_to do |format|
      if @task_priority.save
        format.html { redirect_to @task_priority, notice: "Task priority was successfully created." }
        format.json { render :show, status: :created, location: @task_priority }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task_priority.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_priorities/1 or /task_priorities/1.json
  def update
    respond_to do |format|
      if @task_priority.update(task_priority_params)
        format.html { redirect_to @task_priority, notice: "Task priority was successfully updated." }
        format.json { render :show, status: :ok, location: @task_priority }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task_priority.errors, status: :unprocessable_entity }
      end
    end
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
      @task_priority = TaskPriority.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_priority_params
      params.require(:task_priority).permit(:uid, :name, :color, :processing_time_in_days, :description, :user_id)
    end
end
