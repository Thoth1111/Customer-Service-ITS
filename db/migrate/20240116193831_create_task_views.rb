class CreateTaskViews < ActiveRecord::Migration[7.0]
  def change
    create_table :task_views do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, polymorphic: true
      t.datetime :viewed_at

      t.timestamps
    end
  end
end
