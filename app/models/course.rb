class Course < ApplicationRecord
  has_many :user_courses, dependent: :destroy
  has_many :users, through: :user_courses
  has_many :course_subjects, dependent: :destroy
  has_many :subject, through: :course_subjects
  scope :course_not_delete, ->{where trash: 0}
  accepts_nested_attributes_for :user_courses
end
