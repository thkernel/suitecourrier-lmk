class FeaturesController < ApplicationController
  authorize_resource
  
  before_action :authenticate_user!
  before_action :set_feature, only: [:show, :edit, :update, :destroy]
  layout "dashboard"


  # GET /features
  # GET /features.json
  def index
    @features = Feature.order(id: :desc)
  end

  # GET /features/1
  # GET /features/1.json
  def show
  end

  # GET /features/new
  def new
    Rails.application.eager_load!
    @subject_classes = ApplicationRecord.descendants.map{ |type| [type.name] }
    @feature = Feature.new
  end

  # GET /features/1/edit
  def edit
    Rails.application.eager_load!
    @subject_classes = ApplicationRecord.descendants.map{ |type| [type.name] }
  end

  # POST /features
  # POST /features.json
  def create
    @feature = Feature.new(feature_params)

    respond_to do |format|
      if @feature.save
        @features = Feature.order(id: :desc)
        format.html { redirect_to @feature, notice: 'Fonctionnalité enregistrée avec succès.' }
        format.json { render :show, status: :created, location: @feature }
        format.js
      else
        format.html { render :new }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /features/1
  # PATCH/PUT /features/1.json
  def update
    respond_to do |format|
      if @feature.update(feature_params)
        @features = Feature.order(id: :desc)
        format.html { redirect_to @feature, notice: 'Fonctionnalité modifiée avec succès.' }
        format.json { render :show, status: :ok, location: @feature }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @feature = Feature.find_by(uid: params[:feature_id])
  end

  # DELETE /features/1
  # DELETE /features/1.json
  def destroy
    @feature.destroy
    respond_to do |format|
      format.html { redirect_to features_url, notice: 'Fonctionnalité supprimée avec succès.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feature
      @feature = Feature.find_by(uid: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def feature_params
      params.require(:feature).permit(:name, :subject_class)
    end
end
