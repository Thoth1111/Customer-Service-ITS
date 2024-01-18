class CreateTaskTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :task_types do |t|
      t.string :name, null: false
      t.references :owner, null: false, polymorphic: true
      t.boolean :order_id, default: false
      t.boolean :ticket_id, default: false
      t.boolean :alert_time, default: false
      t.boolean :deadline, default: false
      t.boolean :start_date, default: false
      t.boolean :end_date, default: false
      t.boolean :is_private, default: false

      t.timestamps
    end
  end
end
