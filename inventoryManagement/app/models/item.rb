class Item < ApplicationRecord
    belongs_to :category, foreign_key: "category_name"
end
