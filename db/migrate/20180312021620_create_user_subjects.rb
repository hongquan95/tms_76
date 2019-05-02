class CreateUserSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :user_subjects do |t|
      t.references :user, foreign_key: true
      t.references :subject, foreign_key: true
      t.string :status

      t.timestamps
    end
    add_index :user_subjects, [:user_id, :subject_id], unique: true
  end
end
