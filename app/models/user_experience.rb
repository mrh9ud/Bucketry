class UserExperience < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  has_many :stories

  def set_date
      self.updated_at
  end

  def goal_completion_date
    if self.completed
      self.completion_date
    else
      if self.goal_date
        self.goal_date
      else
        "No goal date set."
      end
    end
  end

  def yes_or_no
    if self.completed
      "yes"
    else
      "no"
    end
  end
end
