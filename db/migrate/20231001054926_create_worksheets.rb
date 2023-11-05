class CreateWorksheets < ActiveRecord::Migration[7.0]
  def change
    create_table :worksheets do |t|
      t.integer :created_by
      t.integer :team_id, null: true
      t.string :title
      t.text :description
      t.integer :task_manager, null: true #Task Manager is a user who is responsible for the task
      t.date :deadline
      t.boolean :completed
      t.datetime :completed_at
      t.integer :completed_by
      t.integer :project_id, null: true

      t.timestamps
    end

    #Foreign Keys
    add_foreign_key :worksheets, :users, column: :created_by
    add_foreign_key :worksheets, :users, column: :task_manager
    add_foreign_key :worksheets, :users, column: :completed_by
    add_foreign_key :worksheets, :teams, column: :team_id
    add_foreign_key :worksheets, :projects, column: :project_id
  end
end
