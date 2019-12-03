class UserExperience < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  has_many :stories

  def set_date
      self.updated_at
  end
end
