class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.integer :task_number
      t.datetime :event_datetime
      t.datetime :completed_at

      t.timestamps null: false
    end
  end
end
