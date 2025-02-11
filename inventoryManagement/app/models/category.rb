class Category < ApplicationRecord
    belongs_to :parent_category, foreign_key: "parent_category", optional: true
    has_many :items, foreign_key: "category_name"
end
