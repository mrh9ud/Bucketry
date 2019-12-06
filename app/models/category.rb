class Category < ApplicationRecord
    has_many :category_activities
    has_many :activities, through: :category_activities
    has_many :user_experiences, through: :activities
    validates :name, {presence: true, uniqueness: {case_sensitive: false}}
end