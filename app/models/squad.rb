class Squad < ApplicationRecord
    has_many :memberships
    has_many :users, through: :memberships

    validates :name, presence: true, length: { maximum: 30 }, uniqueness: true, message: "Name is required and must be less than 30 characters"
end
