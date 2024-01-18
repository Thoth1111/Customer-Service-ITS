class TaskView < ApplicationRecord
    belongs_to :user
    belongs_to :item, polymorphic: true

    validates :user_id, presence: { message: "User is required" }
    validates :item_id, presence: { message: "Item(task/update) is required" }
end
