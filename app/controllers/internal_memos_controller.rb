class InternalMemosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_internal_memo, only: [:show, :edit, :update, :destroy]
  layout "dashboard"


  # GET /internal_memos
  # GET /internal_memos.json
  def index
    @internal_memos = InternalMemo.all
  end

  # GET /internal_memos/1
  # GET /internal_memos/1.json
  def show
  end

  # GET /internal_memos/new
  def new
    @internal_memo = InternalMemo.new
  end

  # GET /internal_memos/1/edit
  def edit
  end

  # POST /internal_memos
  # POST /internal_memos.json
  def create
    @internal_memo = current_user.internal_memo.build(internal_memo_params)

    respond_to do |format|
      if @internal_memo.save
        format.html { redirect_to @internal_memo, notice: 'Internal memo was successfully created.' }
        format.json { render :show, status: :created, location: @internal_memo }
      else
        format.html { render :new }
        format.json { render json: @internal_memo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /internal_memos/1
  # PATCH/PUT /internal_memos/1.json
  def update
    respond_to do |format|
      if @internal_memo.update(internal_memo_params)
        format.html { redirect_to @internal_memo, notice: 'Internal memo was successfully updated.' }
        format.json { render :show, status: :ok, location: @internal_memo }
      else
        format.html { render :edit }
        format.json { render json: @internal_memo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /internal_memos/1
  # DELETE /internal_memos/1.json
  def destroy
    @internal_memo.destroy
    respond_to do |format|
      format.html { redirect_to internal_memos_url, notice: 'Internal memo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internal_memo
      @internal_memo = InternalMemo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def internal_memo_params
      params.require(:internal_memo).permit(:uid, :mail_type_id, :priority_id, :correspondent_id, :folder_id, :status, :user_id)
    end
end
