# Clear existing data (optional)
ParentCategory.delete_all
Category.delete_all
Department.delete_all
User.delete_all
Item.delete_all
Inventory.delete_all
UserInventory.delete_all

# Create Parent Categories
parent_category_tools = ParentCategory.create!(parent_category: "Tools", icon: "🛠️", color_code: "#FF5733")
parent_category_materials = ParentCategory.create!(parent_category: "Materials", icon: "📦", color_code: "#33C1FF")
parent_category_equipment = ParentCategory.create!(parent_category: "Equipment", icon: "🏗️", color_code: "#FFC300")

# Create Categories
Category.create!([
  { name: "Hand Tools", parent_category: parent_category_tools, icon: "🔧", color_code: "#DAF7A6" },
  { name: "Construction Materials", parent_category: parent_category_materials, icon: "🏠", color_code: "#C70039" },
  { name: "Heavy Equipment", parent_category: parent_category_equipment, icon: "🚜", color_code: "#900C3F" }
])

# Create Engineering Departments
Department.create!([
  { id: "CHE", name: "Chemical Engineering" },
  { id: "MECH", name: "Mechanical Engineering" },
  { id: "EE", name: "Electrical Engineering" },
  { id: "CIV", name: "Civil Engineering" },
  { id: "ENV", name: "Environmental Engineering" }
])

# Create Users
User.create!([
  { email: "alice@example.com", name: "Alice Johnson", role: "Admin", department_id: "CHE" },
  { email: "bob@example.com", name: "Bob Williams", role: "Staff", department_id: "MECH" },
  { email: "charlie@example.com", name: "Charlie Lee", role: "Technician", department_id: "EE" }
])

# Create Items
Item.create!([
  { sku: "TOOL001", name: "Hammer", description: "16 oz claw hammer", category_name: "Hand Tools" },
  { sku: "MAT001", name: "Cement", description: "50 kg bag of cement", category_name: "Construction Materials" },
  { sku: "EQP001", name: "Excavator", description: "Medium-sized hydraulic excavator", category_name: "Heavy Equipment" }
])

# Create Inventories
Inventory.create!([
  { item_sku: "TOOL001", year_of_purchase: Date.new(2023, 5, 10), location: "Tool Shed", condition_of_item: "New" },
  { item_sku: "MAT001", year_of_purchase: Date.new(2023, 6, 15), location: "Warehouse A", condition_of_item: "New" },
  { item_sku: "EQP001", year_of_purchase: Date.new(2022, 11, 1), location: "Equipment Yard", condition_of_item: "Used" }
])

# Create User Inventories
UserInventory.create!([
  { owner_email: "alice@example.com", user_email: "bob@example.com", inventory_id: Inventory.first.id },
  { owner_email: "bob@example.com", user_email: "charlie@example.com", inventory_id: Inventory.last.id }
])
