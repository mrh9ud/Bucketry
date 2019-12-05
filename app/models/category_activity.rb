class CategoryActivity < ApplicationRecord
  belongs_to :activity
  belongs_to :category
  validates :activity_id, uniqueness: {scope: :category_id, message: "Activity is already associated with this tag."}
end
