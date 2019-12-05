class UserExperience < ApplicationRecord
  include UserExperiencesHelper
  belongs_to :user
  belongs_to :activity
  has_many :stories
  validates :activity_id, uniqueness: { scope: :user_id, message: "This activity is already on your Bucketry list" }
  accepts_nested_attributes_for :activity, reject_if: :activity_chosen

  def activity_chosen
    self.activity_id
  end

  def set_date
      self.updated_at
  end

  def activity_name #method used in collection_select when creating story
    self.activity.name
  end

  def goal_completion_date
    if self.completed
      self.completion_date.strftime("%d %B %Y")
    else
      if self.goal_date
        self.goal_date.strftime("%d %b %Y")
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
