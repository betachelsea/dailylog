class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :subject, null: false
      t.integer :status, default: 0, null: false
      t.float :estimate_hours

      t.timestamps null: false
    end
  end
end
