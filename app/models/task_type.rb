class TaskType < ApplicationRecord
  belongs_to :owner, polymorphic: true
  has_many :tasks
  has_one :status_group, dependent: :destroy

  validates :owner, presence: { message: 'Owner(user/squad) is required' }
  validates :name, presence: { message: 'Name is required' },
                   length: { maximum: 25, message: 'Name must be less than 25 characters' },
                   uniqueness: { message: 'Name must be unique' }
end
