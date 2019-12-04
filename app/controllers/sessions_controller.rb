class SessionsController < ApplicationController

    def new
    end

    def create
        session[:name] = params[:name]
        session[:user_id] = 1 #hardcoded for testing purposes, change later
        redirect_to root_path
    end

    def destroy
        session.clear
        redirect_to login_path
    end
end
