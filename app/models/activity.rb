class Activity < ApplicationRecord
    has_many :category_activities
    has_many :categories, through: :category_activities
    has_many :user_experiences
    has_many :users, through: :user_experiences
    has_many :stories, through: :user_experiences
    validates :name, :description, presence: true
    
    
end
