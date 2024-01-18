class Task < ApplicationRecord
    belongs_to :owner, polymorphic: true
    belongs_to :task_group, optional: true
    belongs_to :task_type, optional: true
    has_many :notifications, dependent: :destroy
    has_many :task_views, as: :item, dependent: :destroy

    validates :note, presence: true, length: { maximum: 350 }, message: "Note is required"
end
