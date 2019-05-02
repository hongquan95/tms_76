class CreateCourseSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :course_subjects do |t|
      t.references :course, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
    add_index :course_subjects, [:course_id, :subject_id], unique: true
  end
end
