class ApplicationController < ActionController::Base
protect_from_forgery with: :exception
helper_method :current_user
before_action :initialize_session
before_action :load_cart

    def current_user
        if session[:user_id]
            @current_user = User.find(session[:user_id])
        end
    end

    def authorize
        if !current_user
          flash[:alert] = "You must be signed in first."
          redirect_to '/'
        end
    end

    def initialize_session
        session[:productquantity] ||= []
        session[:cart] ||= []
    end

    def load_cart
        @cart = Product.where(id: session[:cart])
    end

end
