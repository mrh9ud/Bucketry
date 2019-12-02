class UserExperience < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  has_many :stories
end
