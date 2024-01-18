class TaskType < ApplicationRecord
    belongs_to :owner, polymorphic: true
    has_many :tasks
    has_one :status_group, dependent: :destroy
    
    validates :name, presence: true, message: "Name is required"
    validates :name, uniqueness: true, length: { maximum: 25 }, message: "Name must be unique and less than 25 characters"
end
