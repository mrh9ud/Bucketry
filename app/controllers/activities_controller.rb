class ActivitiesController < ApplicationController
    before_action :set_activity, only: [:edit, :update, :show]
    before_action :require_login, only: [:new, :create, :update, :edit]
    

    def index
        @activities = Activity.sort_by_popularity
    end

    def new
        @activity = Activity.new
    end

    def create
        @activity = Activity.create(activity_params)
        if @activity.valid?
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
        params.require(:activity).permit(:name, :description)
    end
end
