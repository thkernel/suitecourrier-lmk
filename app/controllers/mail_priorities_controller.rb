class MailPrioritiesController < ApplicationController
  authorize_resource
  before_action :authenticate_user!
  layout "dashboard"
  
  before_action :set_mail_priority, only: %i[ show edit update destroy ]

  # GET /mail_priorities or /mail_priorities.json
  def index
    @mail_priorities = MailPriority.order(id: :desc)
  end

  # GET /mail_priorities/1 or /mail_priorities/1.json
  def show
  end

  # GET /mail_priorities/new
  def new
    @mail_priority = MailPriority.new
  end

  # GET /mail_priorities/1/edit
  def edit
  end

  # POST /mail_priorities or /mail_priorities.json
  def create
    @mail_priority = current_user.mail_priorities.build(mail_priority_params)

    respond_to do |format|
      if @mail_priority.save
        @mail_priorities = MailPriority.order(id: :desc)
        format.html { redirect_to @mail_priority, notice: "Mail priority was successfully created." }
        format.json { render :show, status: :created, location: @mail_priority }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mail_priority.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /mail_priorities/1 or /mail_priorities/1.json
  def update
    respond_to do |format|
      if @mail_priority.update(mail_priority_params)
        @mail_priorities = MailPriority.order(id: :desc)
        format.html { redirect_to @mail_priority, notice: "Mail priority was successfully updated." }
        format.json { render :show, status: :ok, location: @mail_priority }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mail_priority.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


# Use callbacks to share common setup or constraints between actions.
    def delete
      @mail_priority = MailPriority.find_by(uid: params[:mail_priority_id])
    end


  # DELETE /mail_priorities/1 or /mail_priorities/1.json
  def destroy
    @mail_priority.destroy
    respond_to do |format|
      format.html { redirect_to mail_priorities_url, notice: "Mail priority was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mail_priority
      @mail_priority = MailPriority.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mail_priority_params
      params.require(:mail_priority).permit(:name)
    end
end
