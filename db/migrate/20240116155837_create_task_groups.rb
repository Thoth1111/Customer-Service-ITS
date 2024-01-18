class CreateTaskGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :task_groups do |t|
      t.string :name
      t.references :owner, null: false, polymorphic: true

      t.timestamps
    end
  end
end
