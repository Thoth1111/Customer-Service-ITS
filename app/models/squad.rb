class Squad < ApplicationRecord
    has_many :memberships, dependent: :destroy
    has_many :users, through: :memberships
    has_many :task_groups, as: :owner, dependent: :destroy
    has_many :task_types, as: :owner, dependent: :destroy
    has_many :tasks, as: :owner, dependent: :destroy

    validates :name, presence: true, length: { maximum: 50 }, uniqueness: true, message: "Name is required and must be less than 30 characters"
end
