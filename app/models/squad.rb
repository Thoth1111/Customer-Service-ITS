class Squad < ApplicationRecord
    has_many :memberships
    has_many :users, through: :memberships
    has_many :task_groups
    has_many :tasks, through: :task_groups

    validates :name, presence: true, length: { maximum: 30 }, uniqueness: true, message: "Name is required and must be less than 30 characters"
end
