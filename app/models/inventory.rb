class Inventory < ApplicationRecord
    self.primary_key = "inv_id"
    belongs_to :item, foreign_key: "item_id"
    belongs_to :original_owner, class_name: "User", foreign_key: "owner_email"
    belongs_to :current_user, class_name: "User", foreign_key: "user_email"

    validates :item_id, :year_of_purchase, :location, :condition_of_item, :owner_email, :user_email, :sku, presence: true

    def self.search(query)
        joins(:item).where("items.name LIKE ?", "%#{query}%")
    end

    def item_name
        item.name
    end
      
end
