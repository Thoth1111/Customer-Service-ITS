class StatusGroup < ApplicationRecord
  belongs_to :status_group
  has_many :status_colors, dependent: :destroy

  validates :status1, :status2, presence: { message: 'Two statuses are required' }
  validates :status1, :status2, :status3, :status4, :status5,
            length: { maximum: 25, message: 'Status must be less than 25 characters' }
end
