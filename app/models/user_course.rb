class UserCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course
  scope :find_user, ->(id){where "course_id = ?",id}
  scope :find_user_not_in_course, ->(id){where "course_id NOT IN (?)",id}
end
