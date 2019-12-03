class ApplicationController < ActionController::Base
    helper_method :set_relevant_dates    

        def set_relevant_dates(object_array)
            object_array.each { |obj| obj.set_date }             
        end
end
