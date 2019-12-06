class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :show, :update]
    before_action :require_logout, only: [:new, :create]
    before_action :require_login, only: [:show]

    def index
        @users = User.all
    end

    def show
        @upcoming_activities = @user.bucket_list.where("goal_date < ? AND completed = false", Date.today + 60)
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            log_in(@user)
            redirect_to root_path
        else
            render :new
        end
    end

    def edit 
        unless check_current_user(@user)
            flash[:error] = "You do not have access to this page."
            redirect_to user_path(@user)
        end
    end

    def update
        unless check_current_user(@user)
            flash[:error] = "You do not have access to this feature."
            redirect_to user_path(@user)
        end

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
        params.require(:user).permit(:name, :birthdate, :gender, :alive, :password, :password_confirmation)
    end
end
