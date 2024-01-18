class CreateSquads < ActiveRecord::Migration[7.0]
  def change
    create_table :squads do |t|
      t.string :name
      t.string :logo, null: true

      t.timestamps
    end
  end
end
