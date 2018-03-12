class Trainer::CoursesController < ApplicationController
  before_action :logged_in_user, :verify
  before_action :load_course, except: %i(index create new)

  def index
    @courses = Course.paginate page: params[:page], per_page: 10
  end

  def show
    #find all user in a course
    list_user = Course.find(params[:id]).users
    @trainee = list_user.trainee.paginate page: params[:page]
    @trainer = list_user.trainer
    # byebug
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:success] = t ".sucess"
      redirect_to  trainer_courses_path
    else
      flash[:error] = t ".erorr"
      render :new
    end
  end

  def edit
    # byebug
    @course.user_courses.build
  end

  def update
    # byebug
    return render :edit unless @course.update_attributes(course_params)
    flash[:success] = t ".success"
    redirect_to  trainer_have_courses_path(current_user)
  end

  def destroy
    if @course.destroy
      flash[:success] = t ".successdelete"
    else
      flash[:danger] = t ".invalid"
    end
    redirect_to trainer_courses_path
  end

  def add_member? para
    para == "Add Member"
  end

  private

  def course_params
    byebug
    if add_member? params[:commit]
      params.require(:course).permit(:name, :description, :start_date, :end_date, user_courses_attributes: [:id, :user_id ])
    else
      params.require(:course).permit :name, :description, :start_date, :end_date
    end
  end

  def load_course
    @course = Course.find_by id: params[:id]
    @course || render(file: "public/404.html", status: 404, layout: true)
  end
end
