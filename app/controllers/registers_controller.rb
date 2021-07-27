class RegistersController < ApplicationController
  authorize_resource
  before_action :authenticate_user!
  layout "dashboard"
  before_action :set_register, only: [:show, :edit, :update, :destroy]

  # GET /registers
  # GET /registers.json
  def index
    @registers = Register.all
    record_activity("Afficher la liste des registres.")

  end

  # GET /registers/1
  # GET /registers/1.json
  def show
  end

  # GET /registers/new
  def new
    @register_types = RegisterType.all
    @register = Register.new
    
  end

  # GET /registers/1/edit
  def edit

    @register_types = RegisterType.all
    

  end

  # POST /registers
  # POST /registers.json
  def create
    @register = current_user.registers.build(register_params)
    
  
    
    Register.where(register_type_id: @register.register_type_id).update_all(status: REGISTER_STATUSES[1][0])
     
    
    @register.status =  REGISTER_STATUSES[0][0]

    respond_to do |format|
      if @register.save
        record_activity("Créer un nouveau registre (ID: #{@register.id})")

        @registers = Register.all

        format.html { redirect_to @register, notice: 'Registre enregistré avec succès.' }
        format.json { render :show, status: :created, location: @register }
        format.js
      else
        format.html { render :new }
        format.json { render json: @register.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /registers/1
  # PATCH/PUT /registers/1.json
  def update
    

    other_registers = Register.where(register_type_id: @register.register_type_id)
    other_registers = other_registers.where.not(id: @register.id)

    other_registers.update_all(status: REGISTER_STATUSES[1][0])

    #Register.where(register_type_id: @register.register_type_id).update_all(status: REGISTER_STATUSES[1][0])
    #@register.status = @register.register_type

    respond_to do |format|
      if @register.update(register_params)
     
        record_activity("Modifier un registre (ID: #{@register.id})")

        @registers = Register.all

        format.html { redirect_to @register, notice: 'Registre modifié avec succès.' }
        format.json { render :show, status: :ok, location: @register }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @register.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @register = Register.find(params[:register_id])
  end

  # DELETE /registers/1
  # DELETE /registers/1.json
  def destroy
    @register.destroy
    @registers = Register.all

    respond_to do |format|
      record_activity("Supprimer un registre (ID: #{@register.id})")

      format.html { redirect_to registers_url, notice: 'Registre supprimé avec succès.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_register
      @register = Register.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def register_params
      params.require(:register).permit(:start_date, :end_date, :name, :register_type_id, :status)
    end
end
