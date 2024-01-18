class TaskGroup < ApplicationRecord
    belongs_to :owner, polymorphic: true
    has_many :tasks 

    validates :name, presence: true, length: { maximum: 30 }, message: "Name is required and must be less than 30 characters"
end
