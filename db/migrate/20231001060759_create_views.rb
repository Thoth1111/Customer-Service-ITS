class CreateViews < ActiveRecord::Migration[7.0]
  def change
    create_table :views do |t|
      t.string :entity_type
      t.integer :entity_id
      t.integer :user_id
      t.timestamp :view_time

      t.timestamps
    end
  end
end
