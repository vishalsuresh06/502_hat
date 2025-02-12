class ParentCategory < ApplicationRecord
    has_many :categories, foreign_key: "parent_category"
end
