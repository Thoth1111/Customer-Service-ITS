class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :created_by
      t.string :logo
      t.integer :team_lead

      t.timestamps
    end
  end
end
