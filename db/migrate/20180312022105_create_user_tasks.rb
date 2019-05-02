class CreateUserTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :user_tasks do |t|
      t.references :user, foreign_key: true
      t.references :task, foreign_key: true
      t.string :status

      t.timestamps
    end
    add_index :user_tasks, [:user_id, :task_id], unique: true
  end
end
