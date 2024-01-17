class CreateStatusGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :status_groups do |t|
      t.string :status_1, null: false, default: 'open'
      t.string :status_2, null: false, default: 'closed'
      t.string :status_3, null: true
      t.string :status_4, null: true
      t.string :status_5, null: true

      t.timestamps
    end
  end
end
