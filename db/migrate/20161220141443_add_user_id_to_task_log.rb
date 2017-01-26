class AddUserIdToTaskLog < ActiveRecord::Migration
  def up
    add_column :task_logs, :user_id, :integer
    change_column :task_logs, :user_id, :integer, null: false
  end

  def down
    remove_column :task_logs, :user_id
  end
end
