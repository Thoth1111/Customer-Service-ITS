class CreateUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :updates do |t|
      t.references :task, null: false, foreign_key: true
      t.text :note
      t.references :updated_by, null: false, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
