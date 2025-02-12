class UserInventory < ApplicationRecord
    belongs_to :user, foreign_key: "user_email"
    belongs_to :inventory, foreign_key: "inventory_id"
end
