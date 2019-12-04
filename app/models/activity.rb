class Activity < ApplicationRecord
    has_many :category_activities
    has_many :categories, through: :category_activities
    has_many :user_experiences
    has_many :users, through: :user_experiences
    has_many :stories, through: :user_experiences
    validates :name, :description, presence: true
    
    def popularity
        UserExperience.where('activity_id = ?', self.id).count
    end

    def self.sort_by_popularity
        Activity.all.map do |activity|
            [activity, activity.popularity]
            
        end.sort_by { |k, v| -v }.to_h
    end
end
