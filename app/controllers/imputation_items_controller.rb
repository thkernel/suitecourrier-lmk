class ImputationItemsController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  
  before_action :set_imputation_item, only: [:show, :edit, :update, :destroy]
  before_action :set_imputation, only: [:index, :new, :edit]
  # GET /tasks
  # GET /tasks.json
  def index
    @imputation_items = @imputation.imputation_items
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  def search_tasks
    @imputation_items = ImputationItem.all

  end

  # GET /tasks/new
  def new
    @task_statuses = TaskStatus.all
   
    @imputation_item = Task.new
  end

  # GET /tasks/1/edit
  def edit
    #@task_statuses = TaskStatus.all
    #@task_types = TaskType.all
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @imputation_item = current_user.tasks.build(task_params)
    @imputation_item.imputation_id = @@imputation.id

    respond_to do |format|
      if @imputation_item.save
        @imputation_items = ImputationItem.where(imputation_id: @imputation_item.imputation_id)

        format.html { redirect_to imputation_tasks_path(@imputation_item.imputation_id), notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @imputation_item }
        format.js
      else
        format.html { render :new }
        format.json { render json: @imputation_item.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update

    if @imputation_item.task_status_id == TaskStatus.find_by(name: "En cours").id
      @imputation_item.start_date = Time.now
    elsif @imputation_item.task_status_id == TaskStatus.find_by(name: "Terminé").id
      @imputation_item.completed_date = Time.now
      unless @imputation_item.start_date.present?
        
        @imputation_item.start_date = Time.now
      end
    end

    respond_to do |format|
      if @imputation_item.update(task_params)
        #@imputation_items = ImputationItem.where(imputation_id: @imputation_item.imputation_id)
        @imputation = Imputation.find(@imputation_item.imputation_id)

        format.html { redirect_to @imputation_item, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @imputation_item }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @imputation_item.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @imputation_item = ImputationItem.find(params[:task_id])
  end




  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @imputation_item.destroy
    @imputation_items = ImputationItem.where(imputation_id: @imputation_item.imputation_id)

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private

  def set_imputation
    @imputation ||= Imputation.find(params[:id])
    @@imputation = @imputation
  end


    # Use callbacks to share common setup or constraints between actions.
    def set_imputation_item
      @imputation_item = ImputationItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:imputation_item).permit(:title, :description, :start_date, :end_date, :task_status_id, :task_type_id, :closing_date)
    end
end
