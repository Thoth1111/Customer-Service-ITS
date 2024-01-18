class Notification < ApplicationRecord
    belongs_to :user
    belongs_to :task

    validates :user_id, presence: { message: "User is required" }
    validates :task_id, presence: { message: "Task is required" }
    validates :message, presence: { message: "Message is required" }
end
