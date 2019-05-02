class Task < ApplicationRecord
  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks
  has_many :course_subject_tasks, dependent: :destroy
  has_many :subjects, through: :course_subject_tasks
end
