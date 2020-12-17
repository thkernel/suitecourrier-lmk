class DivisionsController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"
  before_action :set_division, only: [:show, :edit, :update, :destroy]

  # GET /divisions
  # GET /divisions.json
  def index
    @divisions = Division.all
    record_activity("Afficher la liste des divisions.")

  end

  # GET /divisions/1
  # GET /divisions/1.json
  def show
  end

  # GET /divisions/new
  def new
    @directions = Direction.all
    @division = Division.new
  end

  # GET /divisions/1/edit
  def edit
    @directions = Direction.all
  end

  # POST /divisions
  # POST /divisions.json
  def create
    @division = current_user.divisions.build(division_params)

    respond_to do |format|
      if @division.save
        record_activity("Créer une division (ID: #{@division.id})")

        @divisions = Division.all
        format.html { redirect_to @division, notice: 'Division was successfully created.' }
        format.json { render :show, status: :created, location: @division }
        format.js
      else
        format.html { render :new }
        format.json { render json: @division.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /divisions/1
  # PATCH/PUT /divisions/1.json
  def update
    respond_to do |format|
      if @division.update(division_params)
        record_activity("Modifier une division (ID: #{@division.id})")

        @divisions = Division.all
        format.html { redirect_to @division, notice: 'Division was successfully updated.' }
        format.json { render :show, status: :ok, location: @division }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @division.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @division = Division.find(params[:division_id])
  end
  # DELETE /divisions/1
  # DELETE /divisions/1.json
  def destroy
    @division.destroy
    respond_to do |format|
      record_activity("Supprimer une division (ID: #{@division.id})")

      format.html { redirect_to divisions_url, notice: 'Division was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_division
      @division = Division.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def division_params
      params.require(:division).permit(:direction_id, :name, :description, :status)
    end
end
