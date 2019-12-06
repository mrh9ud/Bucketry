class UserExperience < ApplicationRecord
  include UserExperiencesHelper
  belongs_to :user
  belongs_to :activity
  has_many :stories
  validates_inclusion_of :completed, in: [true, false]
  validates :activity_id, uniqueness: { scope: :user_id, message: "This activity is already on your Bucketry list" }, on: :create
  accepts_nested_attributes_for :activity, reject_if: :activity_chosen


  def self.find_by_joined(activity, user)
    UserExperience.find_by(activity_id: activity.id, user_id: user.id)
  end

  def activity_chosen
    self.activity_id
  end

  def set_date
      self.updated_at
  end

  def activity_name #method used in collection_select when creating story
    self.activity.name
  end

  def upcoming_deadline?
    self.goal_date && self.goal_date < (Date.today + 60) && !self.completed
  end

  def goal_completion_date
    if self.completion_date
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
