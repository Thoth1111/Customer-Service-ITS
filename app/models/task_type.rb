class TaskType < ApplicationRecord
    validates: :name, presence: true, message: "Name is required"
    validates: :name, uniqueness: true, length: { maximum: 25 }, message: "Name must be unique and less than 25 characters"
end
