class CreateTaskTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :task_types do |t|
      t.string :name, null: false
      t.string :order_id, null: true
      t.string :ticket_id, null: true
      t.datetime :alert_time, null: true
      t.datetime :deadline, null: true
      t.datetime :start_date, null: true
      t.datetime :end_date, null: true
      t.references :statusgroup, null: true, foreign_key: true

      t.timestamps
    end
  end
end
