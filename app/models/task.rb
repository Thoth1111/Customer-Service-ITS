class Task < ApplicationRecord
  belongs_to :owner, polymorphic: true
  belongs_to :task_group, optional: true
  belongs_to :task_type, optional: true
  has_many :notifications, dependent: :destroy
  has_many :task_views, as: :item, dependent: :destroy

  validates :owner, presence: { message: 'Owner(user/squad) is required' }
  validates :note, presence: { message: 'Note is required' },
                   length: { maximum: 350, message: 'Note must be less than 350 characters' }
end
