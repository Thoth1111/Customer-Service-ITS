class CreateViews < ActiveRecord::Migration[7.0]
  def change
    create_table :views do |t|
      t.string :entity_type
      t.integer :entity_id
      t.integer :user_id
      t.timestamp :view_time

      t.timestamps
    end

    add_foreign_key :views, :users, column: :user_id
    add_index :views, [:entity_type, :entity_id]
  end
end
