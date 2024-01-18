class Update < ApplicationRecord
  belongs_to :task
  has_many :task_views, as: :item, dependent: :destroy

  validates :task_id, presence: { message: 'Task is required' }
  validates :note, presence: { message: 'Note is required' },
                   length: { maximum: 350, message: 'Note must be less than 350 characters' }
end
