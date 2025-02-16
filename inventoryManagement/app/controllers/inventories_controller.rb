class InventoriesController < ApplicationController
    def index
        if params[:search].present?
            @inventories = Inventory.search(parems[:search])
        else
            @inventories = Inventory.all
        end
    end
end
