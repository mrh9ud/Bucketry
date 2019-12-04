class UserExperiencesController < ApplicationController
    before_action :get_user_experience, only: [:update, :destroy]
    before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
    
    def new
        @user_experience = UserExperience.new()
        @activity = Activity.new
    end

    def create
        @user_experience = UserExperience.create(user_experience_params)
        if @user_experience.valid?
            redirect_to user_path(@user_experience.user)
        else
            render :new
        end
    end

    def update 
        byebug
        @user_experience.update(user_experience_params)

        if @user_experience.valid?
            redirect_to user_path(@user_experience.user)
        else
            render :edit
        end
    end

    private

    def get_user_experience
        @user_experience = UserExperience.find(params[:id])
    end

    def user_experience_params
        params.require(:user_experience).permit(:user_id, :activity_id, :completed, :completion_date, :goal_date, activity_attributes: [:name, :description])
    end


end
