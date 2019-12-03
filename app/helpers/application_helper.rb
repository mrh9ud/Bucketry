module ApplicationHelper

    def display_created_time(element)
        element.created_at.strftime("at %l:%M %p")
    end

    def display_created_date(element)
        if element.created_at.to_date == Date.current
            "today"
        else 
            element.created_at.strftime("on %B %e")
        end
    end

    def display_update_time(element)
        element.updated_at.strftime("at %l:%M %p")
    end

    def display_update_date(element)
        if element.updated_at.to_date == Date.current
            "today"
        else
            element.updated_at.strftime("on %B %e")
        end
    end
end
