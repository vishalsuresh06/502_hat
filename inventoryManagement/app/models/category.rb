class Category < ApplicationRecord
    self.primary_key = "cat_id"
    has_many :items, foreign_key: "category_id", dependent: :destroy
end
