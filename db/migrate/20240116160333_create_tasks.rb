class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :TaskGroup, null: true, foreign_key: true
      t.references :TaskType, null: true, foreign_key: true
      t.text :note, null: false
      t.references :created_by, null: false, foreign_key: { to_table: :users }
      t.boolean :is_resolved, null: false, default: false
      t.references :resolved_by, null: true, foreign_key: { to_table: :users }
      t.boolean :is_binned, null: false, default: false
      t.string :priority, null: false, default: 'normal'
      t.references :assignee, null: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
