class UserExperiencesController < ApplicationController
    before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
    
    def new
        @user_experience = UserExperience.new()
        @activity = Activity.new
    end

    def create
        @user_experience = UserExperience.new(user_experience_params)
        @user_experience.user_id = current_user.id
        
        # byebug
        # @user_experience.save!
        if @user_experience.valid?
            @user_experience.save!
            redirect_to user_path(@user_experience.user)
        else
            render :new
        end
    end

    private

    def user_experience_params
        params.require(:user_experience).permit(:user_id, :activity_id, :completed, :"goal_date(1i)", :"goal_date(2i)", :"goal_date(3i)", :"completion_date(1i)", :"completion_date(2i)", :"completion_date(3i)", activity_attributes: [:name, :description])
    end


end
