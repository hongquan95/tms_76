class Subject < ApplicationRecord
  has_many :user_subjects, dependent: :destroy
  has_many :users, through: :user_subjects
  has_many :course_subjects, dependent: :destroy
  has_many :courses, through: :course_subjects
  has_many :course_subject_tasks, dependent: :destroy
  has_many :tasks, through: :course_subject_tasks
end
