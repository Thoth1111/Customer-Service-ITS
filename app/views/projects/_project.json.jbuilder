json.extract! project, :id, :created_by, :name, :description, :status, :deadline, :completed, :completed_at, :datetime,
              :completed_by, :coordinator, :created_at, :updated_at
json.url project_url(project, format: :json)
