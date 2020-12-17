class NaturesController < ApplicationController
  authorize_resource
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_nature, only: [:show, :edit, :update, :destroy]

  # GET /natures
  # GET /natures.json
  def index
    @natures = Nature.all
    record_activity("Afficher la liste des nature de courrier.")

  end

  # GET /natures/1
  # GET /natures/1.json
  def show
  end

  # GET /natures/new
  def new
    @nature = Nature.new
  end

  

  # GET /natures/1/edit
  def edit
  end

  # POST /natures
  # POST /natures.json
  def create
    @nature = current_user.natures.build(nature_params)

    respond_to do |format|
      if @nature.save
        record_activity("Créer une nature de courrier (ID: #{@nature.id})")

        @natures = Nature.all

        format.html { redirect_to @nature, notice: 'Nature was successfully created.' }
        format.json { render :show, status: :created, location: @nature }
        format.js
      else
        format.html { render :new }
        format.json { render json: @nature.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /natures/1
  # PATCH/PUT /natures/1.json
  def update
    respond_to do |format|
      if @nature.update(nature_params)
        record_activity("Modifier une nature de courrier (ID: #{@nature.id})")

        @natures = Nature.all

        format.html { redirect_to @nature, notice: 'Nature was successfully updated.' }
        format.json { render :show, status: :ok, location: @nature }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @nature.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @nature = Nature.find(params[:nature_id])
  end

  # DELETE /natures/1
  # DELETE /natures/1.json
  def destroy
    @nature.destroy
    @natures = Nature.all

    respond_to do |format|
      record_activity("Supprimer une nature (ID: #{@nature.id})")

      format.html { redirect_to natures_url, notice: 'Nature was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nature
      @nature = Nature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nature_params
      params.require(:nature).permit(:name, :description)
    end
end
