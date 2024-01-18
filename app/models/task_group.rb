class TaskGroup < ApplicationRecord
  belongs_to :owner, polymorphic: true
  has_many :tasks

  validates :owner, presence: { message: 'owner(user/squad) is required' }
  validates :name, presence: { message: 'name is required' },
                   length: { maximum: 30, message: 'Name is required and must be less than 30 characters' }
end
