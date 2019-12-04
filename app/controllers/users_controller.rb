class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :show, :update]
    before_action :require_logout, only: [:new, :create]
    before_action :require_login, only: [:show]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def update
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :birthdate, :gender, :alive)
    end
end
