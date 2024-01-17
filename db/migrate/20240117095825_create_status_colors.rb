class CreateStatusColors < ActiveRecord::Migration[7.0]
  def change
    create_table :status_colors do |t|
      t.references :user, null: false, foreign_key: true
      t.references :statusgroup, null: false, foreign_key: true
      t.string :status_1_color
      t.string :status_2_color
      t.string :status_3_color
      t.string :status_4_color
      t.string :status_5_color

      t.timestamps
    end
  end
end
