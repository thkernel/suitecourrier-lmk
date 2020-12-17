class AdminSetupController < ApplicationController
    protect_from_forgery with: :exception
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    layout "devise"

    def new   
        @user = User.new
    end 


    def create
        @user = User.new(user_params)
        @user.password_confirmation = @user.password

        @user.role_id = Role.find_by(name: "user").id
        

        respond_to do |format|
        if @user.save
            @user.build_profile
            
            format.html { redirect_to dashboard_path, notice: 'Super admin config was successfully created.' }
            format.json { render :show, status: :created, location: @user }
        else
            format.html { render :new }
            format.json { render json: @user.errors, status: :unprocessable_entity }
        end
        end

    end


     # Never trust parameters from the scary internet, only allow the white list through.
     def user_params
        params.require(:user).permit(:login,  :email, :password)
      end


end