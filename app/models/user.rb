class User < ApplicationRecord
    has_many :user_experiences
    has_many :stories, through: :user_experiences
    has_many :activities, through: :user_experiences
end
