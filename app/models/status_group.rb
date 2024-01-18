class StatusGroup < ApplicationRecord
    belongs_to :status_group
    has_many :status_colors, dependent: :destroy

    validates :status_1, :status_2 presence: { message: "Two statuses are required" }
    validates :status_1, :status_2, :status_3, :status_4, :status_5, length: { maximum: 25, message: "Status must be less than 25 characters" }
end
