class UserExperiencesController < ApplicationController
    before_action :get_user_experience, only: [:update, :destroy, :edit]
    before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
    
    def new
        @user_experience = UserExperience.new()
        @activity = Activity.new
    end

    def create
        if (!params[:user_experience][:activity_id].blank?) && (!params[:user_experience][:activity_attributes][:name].blank? || !params[:user_experience][:activity_attributes][:description].blank?)
            flash[:error] = "Please select only an exisiting activity OR create a new activity."
            redirect_to new_user_experience_path
        
        else
            @user_experience = UserExperience.new(user_experience_params)
            @user_experience.user_id = current_user.id
            
            if @user_experience.valid?
                @user_experience.save!
                redirect_to user_path(@user_experience.user)
            else
                render :new
            end
        end
    end

    def edit
        unless check_current_user(@user_experience.user)
            flash[:error] = "You do not have access to this page."
            redirect_to user_path(@user_experience.user)
        end
    end

    def update
        @user_experience.update(user_experience_params)

        if @user_experience.valid?
            redirect_to user_path(@user_experience.user)
        else
            render :edit
        end
    end

    def destroy
        user = @user_experience.user
        @user_experience.destroy
        redirect_to user_path(user)
    end

    private

    def get_user_experience
        @user_experience = UserExperience.find(params[:id])
    end

    def user_experience_params
        params.require(:user_experience).permit(:user_id, :activity_id, :completed, :"goal_date(1i)", :"goal_date(2i)", :"goal_date(3i)", :"completion_date(1i)", :"completion_date(2i)", :"completion_date(3i)", activity_attributes: [:name, :description])
    end


end
