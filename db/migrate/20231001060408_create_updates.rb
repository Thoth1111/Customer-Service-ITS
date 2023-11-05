class CreateUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :updates do |t|
      t.integer :updated_by
      t.text :update_note
      t.string :updatable_type
      t.integer :updatable_id

      t.timestamps
    end

    add_index :updates, [:updatable_id, :updatable_type]
    add_foreign_key :updates, :users, column: :updated_by
  end
end
