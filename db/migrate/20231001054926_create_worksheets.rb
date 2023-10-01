class CreateWorksheets < ActiveRecord::Migration[7.0]
  def change
    create_table :worksheets do |t|
      t.integer :created_by
      t.string :title
      t.string :description
      t.integer :task_manager
      t.date :deadline
      t.boolean :completed
      t.datetime :completed_at
      t.integer :completed_by

      t.timestamps
    end
  end
end
