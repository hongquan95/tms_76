class UserCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course
  scope :find_user, ->(id){where "course_id = ?",id}
end
