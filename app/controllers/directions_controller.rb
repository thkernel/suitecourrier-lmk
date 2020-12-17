class DirectionsController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"
  before_action :set_direction, only: [:show, :edit, :update, :destroy]

  # GET /directions
  # GET /directions.json
  def index
    @directions = Direction.all
    record_activity("Afficher la liste des directions.")

  end

  # GET /directions/1
  # GET /directions/1.json
  def show
  end

  # GET /directions/new
  def new
    @direction = Direction.new
  end

  # GET /directions/1/edit
  def edit
  end

  # POST /directions
  # POST /directions.json
  def create
    @direction = current_user.directions.build(direction_params)

    respond_to do |format|
      if @direction.save
        record_activity("Créer une direction (ID: #{@direction.id})")

        @directions = Direction.all
        format.html { redirect_to @direction, notice: 'Direction was successfully created.' }
        format.json { render :show, status: :created, location: @direction }
        format.js
      else
        format.html { render :new }
        format.json { render json: @direction.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /directions/1
  # PATCH/PUT /directions/1.json
  def update
    respond_to do |format|
      if @direction.update(direction_params)
        record_activity("Modifier une direction (ID: #{@direction.id})")

        @directions = Direction.all
        format.html { redirect_to @direction, notice: 'Direction was successfully updated.' }
        format.json { render :show, status: :ok, location: @direction }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @direction.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @direction = Direction.find(params[:direction_id])
  end

  # DELETE /directions/1
  # DELETE /directions/1.json
  def destroy
    @direction.destroy
    respond_to do |format|
      record_activity("Supprimer une direction (ID: #{@direction.id})")

      format.html { redirect_to directions_url, notice: 'Direction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_direction
      @direction = Direction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def direction_params
      params.require(:direction).permit(:name, :description, :status)
    end
end
