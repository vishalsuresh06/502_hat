class Department < ApplicationRecord
    has_many :users, foreign_key: "department_id"
end
