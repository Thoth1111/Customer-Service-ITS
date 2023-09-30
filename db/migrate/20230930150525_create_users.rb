class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :role
      t.string :avatar
      t.string :phone_num
      t.string :status

      t.timestamps
    end
  end
end
