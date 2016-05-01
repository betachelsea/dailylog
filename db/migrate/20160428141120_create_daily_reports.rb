class CreateDailyReports < ActiveRecord::Migration
  def change
    create_table :daily_reports do |t|
      t.datetime :date, null: false
      t.text :body
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
