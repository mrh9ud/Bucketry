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
        name = params[:name]
        user = User.find_by(name: name)
        if user
            session[:name] = params[:name]
            log_in(user)
            redirect_to root_path
        else flash["error"] = "No user with that name. Try again."
            redirect_to login_path
        end
    end

    def logout
        session.clear
        redirect_to login_path
    end
end