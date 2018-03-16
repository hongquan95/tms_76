class UserCoursesController < ApplicationController
  before_action :load_user
  def index
    @user_courses = @user.courses.paginate page: params[:page]
  end

  private

  def load_user
    # byebug
    @user = User.find_by id: params[:user_id]
    @user || render(file: "public/404.html", status: 404, layout: true)
  end
end
