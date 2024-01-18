class CreateStatusGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :status_groups do |t|
      t.string :status1, null: false, default: 'open'
      t.string :status2, null: false, default: 'closed'
      t.string :status3, null: true
      t.string :status4, null: true
      t.string :status5, null: true

      t.timestamps
    end
  end
end
