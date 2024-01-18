class User < ApplicationRecord
    has_many :memberships, dependent: :destroy
    has_many :squads, through: :memberships
    has_many :task_groups, as: :owner, dependent: :destroy
    has_many :task_types, as: :owner, dependent: :destroy
    has_many :tasks, as: :owner, dependent: :destroy
    has_many :task_views, as: :item, dependent: :destroy
    has_many :notifications, dependent: :destroy
    has_many :task_views, dependent: :destroy
    has_many :status_colors, dependent: :destroy
    
    validates :name, presence: { message: "Name is required" }, length: { maximum: 50, message: "Name must be less than 50 characters" }
end
