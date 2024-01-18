class StatusColor < ApplicationRecord
  belongs_to :status_group
  belongs_to :user

  validates :status_group_id, presence: { message: 'Status Group is required' }
  validates :user_id, presence: { message: 'User is required' }
end
