class Inventory < ApplicationRecord
    has_many :user_inventories, foreign_key: "inventory_id"
end
