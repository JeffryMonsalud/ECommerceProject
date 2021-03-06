class UsersController < ApplicationController
    
    def index
        @users = User.all
    end
   
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
            if @user.save
                session[:user_id] = @user.id
                redirect_to '/categories'
            else
                flash[:register_errors] = @user.errors.full_messages
                redirect_to '/'
            end
    end

    def current_user
        @user ||= User.find_by(id: session[:user_id])
    end

    def show
        @user = User.find(params[:id])
    end

    private
        def user_params
            params.require(:user).permit(:name, :password, :password_confirmation, :email, :address, :province_id)
        end

end