module ApplicationHelper

    def display_relevant_time(element)
        element.set_date.strftime("at %l:%M %p")
    end

    def display_relevant_date(element)
        if element.set_date.to_date == Date.current
            "today"
        else 
            element.set_date.strftime("on %B %e")
        end
    end
end
