class CreateTaskLogs < ActiveRecord::Migration
  def change
    create_table :task_logs do |t|
      t.integer :task_id, null: false
      t.datetime :started_at, null: false
      t.datetime :finished_at
      t.float :spent_hours, default: 0.0, null: false

      t.timestamps null: false
    end
  end
end
