class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name, null: true
      t.string :email
      t.string :role #Role can be admin, user, team_lead, task_manager, coordinator
      t.string :avatar, null: true
      t.string :phone, null: true

      t.timestamps
    end
  end
end
