class MailStatusesController < ApplicationController
  authorize_resource
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_mail_status, only: %i[ show edit update destroy ]

  # GET /mail_statuses or /mail_statuses.json
  def index
    @mail_statuses = MailStatus.order(id: :desc)
  end

  # GET /mail_statuses/1 or /mail_statuses/1.json
  def show
  end

  # GET /mail_statuses/new
  def new
    @mail_status = MailStatus.new
  end

  # GET /mail_statuses/1/edit
  def edit
  end

  # POST /mail_statuses or /mail_statuses.json
  def create
    @mail_status = current_user.mail_statuses.build(mail_status_params)

    respond_to do |format|
      if @mail_status.save
        @mail_statuses = MailStatus.order(id: :desc)
        format.html { redirect_to @mail_status, notice: "Mail status was successfully created." }
        format.json { render :show, status: :created, location: @mail_status }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mail_status.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /mail_statuses/1 or /mail_statuses/1.json
  def update
    respond_to do |format|
      if @mail_status.update(mail_status_params)
        @mail_statuses = MailStatus.order(id: :desc)
        format.html { redirect_to @mail_status, notice: "Mail status was successfully updated." }
        format.json { render :show, status: :ok, location: @mail_status }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mail_status.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @mail_status = MailStatus.find_by(uid: params[:mail_status_id])
  end
  # DELETE /mail_statuses/1 or /mail_statuses/1.json
  def destroy
    @mail_status.destroy
    respond_to do |format|
      format.html { redirect_to mail_statuses_url, notice: "Mail status was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mail_status
      @mail_status = MailStatus.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mail_status_params
      params.require(:mail_status).permit(:name)
    end
end
