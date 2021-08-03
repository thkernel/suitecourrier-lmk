class TicketPrioritiesController < ApplicationController
  authorize_resource
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_ticket_priority, only: %i[ show edit update destroy ]

  # GET /task_priorities or /task_priorities.json
  def index
    @ticket_priorities = TicketPriority.all
  end

  # GET /task_priorities/1 or /task_priorities/1.json
  def show
  end

  # GET /task_priorities/new
  def new
    @ticket_priority = TicketPriority.new
  end

  # GET /task_priorities/1/edit
  def edit
  end

  # POST /task_priorities or /task_priorities.json
  def create
    @ticket_priority = current_user.ticket_priorities.build(ticket_priority_params)

    respond_to do |format|
      if @ticket_priority.save
        @ticket_priorities = TicketPriority.all
        format.html { redirect_to @ticket_priority, notice: "Ticket priority was successfully created." }
        format.json { render :show, status: :created, location: @ticket_priority }
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
      if @ticket_priority.update(ticket_priority_params)
        @ticket_priorities = TicketPriority.all
        format.html { redirect_to @ticket_priority, notice: "Ticket priority was successfully updated." }
        format.json { render :show, status: :ok, location: @ticket_priority }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket_priority.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
      @ticket_priority = TicketPriority.find_by(uid: params[:ticket_priority_id])
    end

  # DELETE /task_priorities/1 or /task_priorities/1.json
  def destroy
    @ticket_priority.destroy
    respond_to do |format|
      format.html { redirect_to ticket_priorities_url, notice: "Ticket priority was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket_priority
      @ticket_priority = TicketPriority.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_priority_params
      params.require(:ticket_priority).permit(:uid, :name, :color, :processing_time_in_days)
    end
end
