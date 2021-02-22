class MailTypesController < ApplicationController
  authorize_resource
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_mail_type, only: [:show, :edit, :update, :destroy]

  # GET /natures
  # GET /natures.json
  def index
    @mail_types = MailType.all
    #record_activity("Afficher la liste des nature de courrier.")

  end

  # GET /natures/1
  # GET /natures/1.json
  def show
  end

  # GET /natures/new
  def new
    @mail_type = MailType.new
  end

  

  # GET /natures/1/edit
  def edit
  end

  # POST /natures
  # POST /natures.json
  def create
    @mail_type = current_user.mail_types.build(mail_type_params)

    respond_to do |format|
      if @mail_type.save
        record_activity("Créer une nature de courrier (ID: #{@mail_type.id})")

        @mail_types = MailType.all

        format.html { redirect_to @mail_type, notice: 'MailType was successfully created.' }
        format.json { render :show, status: :created, location: @mail_type }
        format.js
      else
        format.html { render :new }
        format.json { render json: @mail_type.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /natures/1
  # PATCH/PUT /natures/1.json
  def update
    respond_to do |format|
      if @mail_type.update(mail_type_params)
        record_activity("Modifier une nature de courrier (ID: #{@mail_type.id})")

        @mail_types = MailType.all

        format.html { redirect_to @mail_type, notice: 'MailType was successfully updated.' }
        format.json { render :show, status: :ok, location: @mail_type }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @mail_type.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @mail_type = MailType.find(params[:mail_type_id])
  end

  # DELETE /natures/1
  # DELETE /natures/1.json
  def destroy
    @mail_type.destroy
    

    respond_to do |format|
      @mail_types = MailType.all
      record_activity("Supprimer un type de courrier (ID: #{@mail_type.id})")

      format.html { redirect_to mail_type_url, notice: 'MailType was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mail_type
      @mail_type = MailType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mail_type_params
      params.require(:mail_type).permit(:name, :description)
    end
end
