class StoriesController < ApplicationController
    before_action :get_story, only: [:show, :edit, :update, :destroy]

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

    def new
        @story = Story.new()
    end

    def create
        @story = Story.create(strong_params)

        if @story.valid?
            redirect_to story_path(@story)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @story.update(strong_params)

        if @story.valid?
            redirect_to story_path(@story)
        else
            render :edit
        end
    end

    def destroy
        user_id = @story.user.id
        @story.destroy
        redirect_to user_path(@story.user)
    end


    private

    def get_story
        @story = Story.find(params[:id])
    end

    def strong_params
        params.require(:story).permit(:title, :content, :user_experience_id)
    end
end
