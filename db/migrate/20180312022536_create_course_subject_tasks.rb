class CreateCourseSubjectTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :course_subject_tasks do |t|
      t.references :course, foreign_key: true
      t.references :subject, foreign_key: true
      t.references :task, foreign_key: true

      t.timestamps
    end

  end
end
