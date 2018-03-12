class Trainer::UserCoursesController < ApplicationController
  before_action :logged_in_user, :verify

  def index
    @user_courses = current_user.courses.paginate page: params[:page]
  end

  def show
    # byebug
    @user_course = UserCourse.find(params[:id])
    @users = User.all
  end

  private

    def user_course_params
      params.require(:user_courses).permit(user_courses_attributes: [:id, :user_id ])

    end
end
