json.extract! worksheet, :id, :created_by, :title, :description, :task_manager, :deadline, :completed, :completed_at, :completed_by, :created_at, :updated_at
json.url worksheet_url(worksheet, format: :json)
