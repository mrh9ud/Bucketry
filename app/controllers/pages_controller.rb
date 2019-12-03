class PagesController < ApplicationController

    def index
        #grab recent actions for display
        @recent_activities = (User.order(created_at: :desc).limit(5) + Story.order(created_at: :desc).limit(5) + UserExperience.order(updated_at: :desc).limit(10)).shuffle
        render :home
    end

end