class InventoriesController < ApplicationController
    before_action :set_inventory, only: [:show, :edit, :update, :destroy]
    def index
        # @inventories = params[:search].present? ? Inventory.search(params[:search]) : Inventory.all
        # @item = Item.new
        # @inventory = Inventory.new
        @item = Item.new
        @inventory = Inventory.new

        sort_column = params[:sort] || 'inv_id'
        sort_direction = params[:direction] == "desc" ? "desc" : "asc"

        @inventories = Inventory.includes(:item)

        if params[:search].present?
            search_query = "%#{params[:search]}%"
            @inventories = @inventories = @inventories.joins(:item).where("items.name LIKE ? OR inventories.location LIKE ? OR inventories.condition_of_item LIKE ? OR inventories.sku LIKE ?",
                search_query, search_query, search_query, search_query)
        end
        
        if sort_column == 'name'
            @inventories = @inventories.order("items.name #{sort_direction}")
        else
            @inventories = @inventories.order("inventories.#{sort_column} #{sort_direction}")
        end
    end

    def show
    end

    def new
        @inventory = Inventory.new
    end

    def create
        @inventory = Inventory.new(inventory_params)
    
        if @inventory.save
          respond_to do |format|
            format.html { redirect_to inventories_path, notice: 'Item successfully added to inventory.' }
            format.js
          end
        else
          render :new, status: :unprocessable_entity
        end
      end

    def edit
        @inventory = Inventory.find(params[:id])
        render json: @inventory.as_json(methods: :item_name)
    end
      

    def update
        @inventory = Inventory.find(params[:id])
        if @inventory.update(inventory_params)
          respond_to do |format|
            format.html { redirect_to inventories_path, notice: 'Inventory item was successfully updated.' }
            format.json { render json: { status: 'success' } }
            format.js   # This will render edit.js.erb
          end
        else
          respond_to do |format|
            format.html { redirect_to inventories_path, alert: 'Error updating inventory item.' }
            format.json { render json: { status: 'error', errors: @inventory.errors.full_messages } }
            format.js   # This will render edit.js.erb with errors
          end
        end
      end
      

    def destroy
        @inventory.destroy
        redirect_to inventories_path, notice: 'Inventory item was deleted.'
    end

    private

    def set_inventory
        @inventory = Inventory.find(params[:id])
    end

    def inventory_params
        params.require(:inventory).permit(:item_id, :year_of_purchase, :location, :condition_of_item, :owner_email, :user_email, :sku)
    end
end
