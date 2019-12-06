class SessionsController < ApplicationController
    before_action :require_logout, only: [:new, :create]
    
    def new
        if session["name"]
            redirect_to root_path
        else
            render :new
        end
    end

    def create
        user = User.find_by(name: params[:name])
        # byebug
        if user 
            if user.authenticate(params[:password])
                session[:name] = params[:name]
                session[:user_id] = user.id
                log_in(user)
                redirect_to root_path
            else
                flash["error"] = "Password not correct. Please try again."
                redirect_to login_path
            end
        else
            flash["error"] = "No user with that name. Please try again."
            redirect_to login_path
        end
    end

    def logout
        session.clear
        redirect_to login_path
    end
end