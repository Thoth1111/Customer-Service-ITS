class CreateStatusColors < ActiveRecord::Migration[7.0]
  def change
    create_table :status_colors do |t|
      t.references :user, null: false, foreign_key: true
      t.references :status_group, null: false, foreign_key: true
      t.string :status_1_color, null: false, default: '#ffffff'
      t.string :status_2_color, null: false, default: '#ffffff'
      t.string :status_3_color, null: true
      t.string :status_4_color, null: true
      t.string :status_5_color, null: true

      t.timestamps
    end
  end
end
