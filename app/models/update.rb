class Update < ApplicationRecord
    belongs_to :task
    has_many :task_views, as: :item, dependent: :destroy

    validates :note, presence: true, length: { maximum: 350 }, message: "Note is required"
end
