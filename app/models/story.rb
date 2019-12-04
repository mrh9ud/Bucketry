class Story < ApplicationRecord
  belongs_to :user_experience
  has_one :user, through: :user_experience
  has_one :activity, through: :user_experience

  validates :title, presence: true
  validates :title, uniqueness: true, on: :create
  validates :content, {presence: true, length: { minimum: 400 }}
  validates :content, uniqueness: true, on: :create
  validates :user_experience_id, presence: true, on: :create

  def set_date
      self.created_at
  end
end
