class Story < ApplicationRecord
  belongs_to :user_experience

  def set_date
      self.created_at
  end
end
