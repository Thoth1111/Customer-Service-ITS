class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :squad

  validates :user_id, presence: { message: 'User is required' },
                      uniqueness: { scope: :squad_id, message: 'User is already a member of this squad' }
  validates :squad_id, presence: { message: 'Squad is required' }
end
