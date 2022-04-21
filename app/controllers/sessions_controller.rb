class SessionsController < ApplicationController

    def create
        @user = User.find_by(email: login_params[:email])   
        if @user && @user.authenticate(login_params[:password])
            session[:user_id] = @user.id 
            redirect_to '/categories'    
        else
            flash[:login_errors] = ['Invalid Email/Password']
            redirect_to '/login'
        end
    end

    def destroy
        session[:user_id] = nil
        session[:cart] = nil
        flash[:notice] = "Signed Out"
        redirect_to '/login'
    end

    private
        def login_params
            params.require(:login).permit(:email, :password)
        end

end
