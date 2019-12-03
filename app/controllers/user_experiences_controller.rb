class UserExperiencesController < ApplicationController

    def new
        @user_experience = UserExperience.new()
    end

    def create
        @user_experience = UserExperience.create(user_experience_params)
        if @user_experience.valid?
            redirect_to user_path(@user_experience.user)
        else
            render :new
        end
    end

    private

    def user_experience_params
        params.require(:user_experience).permit(:user_id, :activity_id, :completed, :completion_date, :goal_date)
    end
end
