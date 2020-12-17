class TicketUsersController < ApplicationController
  before_action :set_ticket_user, only: [:show, :edit, :update, :destroy]

  # GET /ticket_users
  # GET /ticket_users.json
  def index
    @ticket_users = TicketUser.all
  end

  # GET /ticket_users/1
  # GET /ticket_users/1.json
  def show
  end

  # GET /ticket_users/new
  def new
    @ticket_user = TicketUser.new
  end

  # GET /ticket_users/1/edit
  def edit
  end

  # POST /ticket_users
  # POST /ticket_users.json
  def create
    @ticket_user = TicketUser.new(ticket_user_params)

    respond_to do |format|
      if @ticket_user.save
        format.html { redirect_to @ticket_user, notice: 'Ticket user was successfully created.' }
        format.json { render :show, status: :created, location: @ticket_user }
      else
        format.html { render :new }
        format.json { render json: @ticket_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ticket_users/1
  # PATCH/PUT /ticket_users/1.json
  def update
    respond_to do |format|
      if @ticket_user.update(ticket_user_params)
        format.html { redirect_to @ticket_user, notice: 'Ticket user was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket_user }
      else
        format.html { render :edit }
        format.json { render json: @ticket_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ticket_users/1
  # DELETE /ticket_users/1.json
  def destroy
    @ticket_user.destroy
    respond_to do |format|
      format.html { redirect_to ticket_users_url, notice: 'Ticket user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket_user
      @ticket_user = TicketUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_user_params
      params.require(:ticket_user).permit(:uid, :ticket_id, :recipient_id)
    end
end
