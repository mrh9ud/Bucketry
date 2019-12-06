class ActivitiesController < ApplicationController
    before_action :set_activity, only: [:edit, :update, :show]
    before_action :require_login, only: [:new, :create, :update, :edit]
    
    def index
        @activities = Activity.sort_by_popularity
    end

    def show
        @categories = @activity.categories.order(:name)
    end

    def new
        @activity = Activity.new()
    end

    def create
        @activity = Activity.create(activity_params)
        if @activity.valid?
            if params[:add_to_bucket_list]
                UserExperience.create(user_id: current_user.id, activity_id: @activity.id, completed: false)
            end
            redirect_to activity_path(@activity)
        else
            render :new
        end
    end

    def update
        if @activity.update(activity_params)
            redirect_to activity_path(@activity)
        else
            render :edit
        end
    end

    private

    def set_activity
        @activity = Activity.find(params[:id])
    end

    def activity_params
        params.require(:activity).permit(:name, :description, :add_to_bucket_list, category_ids: [])
    end
end
