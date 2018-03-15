class Course < ApplicationRecord
  has_many :user_courses, dependent: :destroy
  has_many :users, through: :user_courses
  has_many :course_subjects, dependent: :destroy
  has_many :subject, through: :course_subjects
  enum  flag_del: {not_del: 0, del: 1}

end
