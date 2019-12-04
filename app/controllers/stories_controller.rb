class StoriesController < ApplicationController
    before_action :get_story, only: [:show, :edit, :update]

    def index
        if params[:blog_expand]
            session[:blog_length] += 5
        else
            session[:blog_length] = 5
        end
        
        @stories = Story.order(created_at: :desc).limit(session[:blog_length]).reverse
    end

    def show
    end


    private

    def get_story
        @story = Story.find(params[:id])
    end
end
