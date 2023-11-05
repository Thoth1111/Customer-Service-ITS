class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :created_by
      t.string :logo
      t.integer :team_lead, null: true #Team Lead is a user who is responsible for the team

      t.timestamps
    end

    #Foreign Keys
    add_foreign_key :teams, :users, column: :created_by
    add_foreign_key :teams, :users, column: :team_lead
  end
end
