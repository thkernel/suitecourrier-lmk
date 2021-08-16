class MailCategoriesController < ApplicationController
  authorize_resource
  before_action :authenticate_user!
  layout "dashboard"
  
  before_action :set_mail_category, only: %i[ show edit update destroy ]

  # GET /mail_categories or /mail_categories.json
  def index
    @mail_categories = MailCategory.order(id: :desc)
  end

  # GET /mail_categories/1 or /mail_categories/1.json
  def show
  end

  # GET /mail_categories/new
  def new
    @mail_category = MailCategory.new
  end

  # GET /mail_categories/1/edit
  def edit
  end

  # POST /mail_categories or /mail_categories.json
  def create
    @mail_category = current_user.mail_categories.build(mail_category_params)

    respond_to do |format|
      if @mail_category.save
        @mail_categories = MailCategory.order(id: :desc)
        format.html { redirect_to @mail_category, notice: "Mail category was successfully created." }
        format.json { render :show, status: :created, location: @mail_category }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mail_category.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /mail_categories/1 or /mail_categories/1.json
  def update
    respond_to do |format|
      if @mail_category.update(mail_category_params)
        @mail_categories = MailCategory.order(id: :desc)
        format.html { redirect_to @mail_category, notice: "Mail category was successfully updated." }
        format.json { render :show, status: :ok, location: @mail_category }
        format.js

      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mail_category.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
      @mail_category = MailCategory.find_by(uid: params[:mail_category_id])
    end

  # DELETE /mail_categories/1 or /mail_categories/1.json
  def destroy
    @mail_category.destroy
    respond_to do |format|
      format.html { redirect_to mail_categories_url, notice: "Mail category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mail_category
      @mail_category = MailCategory.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mail_category_params
      params.require(:mail_category).permit(:name)
    end
end
