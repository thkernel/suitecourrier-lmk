class MailTypesController < ApplicationController
  authorize_resource
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_mail_type, only: %i[ show edit update destroy ]

  # GET /mail_types or /mail_types.json
  def index
    @mail_types = MailType.order(id: :desc)
  end

  # GET /mail_types/1 or /mail_types/1.json
  def show
  end

  # GET /mail_types/new
  def new
    @mail_type = MailType.new
  end

  # GET /mail_types/1/edit
  def edit
  end

  # POST /mail_types or /mail_types.json
  def create
    @mail_type = current_user.mail_types.build(mail_type_params)

    respond_to do |format|
      if @mail_type.save
        @mail_types = MailType.order(id: :desc)
        format.html { redirect_to @mail_type, notice: "Mail type was successfully created." }
        format.json { render :show, status: :created, location: @mail_type }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mail_type.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /mail_types/1 or /mail_types/1.json
  def update
    respond_to do |format|
      if @mail_type.update(mail_type_params)
        @mail_types = MailType.order(id: :desc)
        format.html { redirect_to @mail_type, notice: "Mail type was successfully updated." }
        format.json { render :show, status: :ok, location: @mail_type }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mail_type.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
      @mail_type = MailType.find_by(uid: params[:mail_type_id])
    end

  # DELETE /mail_types/1 or /mail_types/1.json
  def destroy
    @mail_type.destroy
    respond_to do |format|
      format.html { redirect_to mail_types_url, notice: "Mail type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mail_type
      @mail_type = MailType.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mail_type_params
      params.require(:mail_type).permit(:name, :description)
    end
end
