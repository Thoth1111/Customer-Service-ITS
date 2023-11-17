class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.string :role, default: "user"
      t.string :avatar, null: true
      t.string :phone, null: true

      t.timestamps
    end
  end
end
