class StorageAreasController < ApplicationController
  before_action :set_storage_area, only: [:show, :edit, :update, :destroy]

  # GET /storage_areas
  # GET /storage_areas.json
  def index
    @storage_areas = StorageArea.all
  end

  # GET /storage_areas/1
  # GET /storage_areas/1.json
  def show
  end

  # GET /storage_areas/new
  def new
    @storage_area = StorageArea.new
  end

  # GET /storage_areas/1/edit
  def edit
  end

  # POST /storage_areas
  # POST /storage_areas.json
  def create
    @storage_area = StorageArea.new(storage_area_params)

    respond_to do |format|
      if @storage_area.save
        format.html { redirect_to @storage_area, notice: 'Storage area was successfully created.' }
        format.json { render :show, status: :created, location: @storage_area }
      else
        format.html { render :new }
        format.json { render json: @storage_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /storage_areas/1
  # PATCH/PUT /storage_areas/1.json
  def update
    respond_to do |format|
      if @storage_area.update(storage_area_params)
        format.html { redirect_to @storage_area, notice: 'Storage area was successfully updated.' }
        format.json { render :show, status: :ok, location: @storage_area }
      else
        format.html { render :edit }
        format.json { render json: @storage_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storage_areas/1
  # DELETE /storage_areas/1.json
  def destroy
    @storage_area.destroy
    respond_to do |format|
      format.html { redirect_to storage_areas_url, notice: 'Storage area was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_storage_area
      @storage_area = StorageArea.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def storage_area_params
      params.require(:storage_area).permit(:uid, :name, :short_name, :maximum_size, :path, :description, :status, :user_id)
    end
end
