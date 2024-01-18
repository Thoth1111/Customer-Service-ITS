class StatusColor < ApplicationRecord
    belongs_to :status_group
    belongs_to :user
end
