class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.integer :created_by
      t.string :name
      t.integer :team_id, null: true
      t.text :description
      t.string :status
      t.date :deadline, null: true
      t.boolean :completed
      t.datetime :completed_at
      t.integer :completed_by
      t.integer :coordinator, null: true #Coordinator is a user who is responsible for the project

      t.timestamps
    end

    #Foreign Keys
    add_foreign_key :projects, :users, column: :created_by
    add_foreign_key :projects, :users, column: :completed_by
    add_foreign_key :projects, :users, column: :coordinator
    add_foreign_key :projects, :teams, column: :team_id
  end
end
