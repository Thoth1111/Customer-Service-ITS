class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.integer :created_by
      t.string :name
      t.string :description
      t.string :status
      t.date :deadline
      t.boolean :completed
      t.string :completed_at
      t.string :datetime
      t.integer :completed_by
      t.integer :coordinator

      t.timestamps
    end
  end
end
