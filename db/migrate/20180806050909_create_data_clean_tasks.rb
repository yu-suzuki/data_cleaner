class CreateDataCleanTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :data_clean_tasks do |t|
      t.integer :task_id, null: false
      t.string :task_name, null: false

      t.timestamps
    end

    add_index :data_clean_tasks, :task_id, unique: true
  end
end
