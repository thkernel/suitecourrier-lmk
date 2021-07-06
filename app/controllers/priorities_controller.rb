class PrioritiesController < ApplicationController
  authorize_resource
  
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_priority, only: [:show, :edit, :update, :destroy]

  # GET /priorities
  # GET /priorities.json
  def index
    @priorities = Priority.all
  end

  # GET /priorities/1
  # GET /priorities/1.json
  def show
  end

  # GET /priorities/new
  def new
    @priority = Priority.new
  end

  # GET /priorities/1/edit
  def edit
  end

  # POST /priorities
  # POST /priorities.json
  def create
    @priority = current_user.priorities.build(priority_params)

    respond_to do |format|
      if @priority.save
        @priorities = Priority.all

        format.html { redirect_to @priority, notice: 'Priorité enregistrée avec succès.' }
        format.json { render :show, status: :created, location: @priority }
        format.js
      else
        format.html { render :new }
        format.json { render json: @priority.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /priorities/1
  # PATCH/PUT /priorities/1.json
  def update
    respond_to do |format|
      if @priority.update(priority_params)
        @priorities = Priority.all

        format.html { redirect_to @priority, notice: 'Priorité modifiée avec succès.' }
        format.json { render :show, status: :ok, location: @priority }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @priority.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @priority = Priority.find(params[:priority_id])
  end


  # DELETE /priorities/1
  # DELETE /priorities/1.json
  def destroy
    @priority.destroy
    respond_to do |format|
      format.html { redirect_to priorities_url, notice: 'Priorité supprimée avec succès.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_priority
      @priority = Priority.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def priority_params
      params.require(:priority).permit(:name, :color, :processing_time_in_days, :description)
    end
end
