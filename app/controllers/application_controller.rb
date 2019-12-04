class ApplicationController < ActionController::Base
    helper_method :set_relevant_dates 
    include SessionsHelper 

    def set_relevant_dates(object_array)
        object_array.each { |obj| obj.set_date }             
    end

    private

    def require_login
        unless logged_in?
            flash[:error] = "You must be logged in to access this section"
            redirect_to login_path #halts request cycle
        end
    end

    def require_logout
        if logged_in?
            flash[:error] = "You can't login twice."
            redirect_to root_path
        end
    end
end

