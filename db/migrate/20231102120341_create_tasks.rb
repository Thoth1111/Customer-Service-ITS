class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.text :description
      t.string :type
      t.timestamptz :start_time
      t.timestamptz :end_time
      t.integer :created_by
      t.integer :completed_by
      t.boolean :public
      t.boolean :completed
      t.integer :worksheet_id, null: true
      t.integer :project_id, null: true

      t.timestamps
    end

    add_foreign_key :tasks, :users, column: :created_by
    add_foreign_key :tasks, :users, column: :completed_by
    add_foreign_key :tasks, :worksheets, column: :worksheet_id
    add_foreign_key :tasks, :projects, column: :project_id
  end
end
