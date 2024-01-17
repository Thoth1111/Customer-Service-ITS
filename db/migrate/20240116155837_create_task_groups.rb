class CreateTaskGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :task_groups do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.references :squad, null: true, foreign_key: true

      t.timestamps
    end
  end
end
