class User < ApplicationRecord
    has_many :memberships
    has_many :squads, through: :memberships
    has_many :task_groups
    has_many :tasks
    has_many :notifications
    has_many :task_views
    has_many :status_colors
    
    validates :name, presence: true, length: { maximum: 30 } message: "Name is required and must be less than 30 characters"
end
