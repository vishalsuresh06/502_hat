class User < ApplicationRecord
    belongs_to :department, foreign_key: "department_id"
    has_many :user_inventories, foreign_key: "user_email"
end
