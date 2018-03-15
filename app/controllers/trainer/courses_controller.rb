class Trainer::CoursesController < ApplicationController
  before_action :logged_in_user, :verify
  before_action :load_course, except: %i(index create new)

  def index
    @courses = Course.not_del.paginate page: params[:page], per_page: Settings.per_page_course
  end

  def show
    @trainee = @course.users.trainee.paginate page: params[:page]
    @trainer = @course.users.trainer
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:success] = t ".sucess"
      redirect_to trainer_courses_path
    else
      flash[:error] = t ".erorr"
      render :new
    end
  end

  def edit
    @course.user_courses.build
  end

  def update
    return render :edit unless @course.update_attributes(course_params)
    flash[:success] = t ".success"
    redirect_to trainer_have_courses_path(current_user)
  end

  def destroy
    if @course.destroy
      flash[:success] = t ".success_delete"
    else
      flash[:danger] = t ".invalid"
    end
    redirect_to trainer_courses_path
  end

  def del_course
    if @course.update_attributes(flag_del: :del)
      flash[:success] = t ".success_delete"
    else
      flash[:danger] = t ".invalid"
    end
    redirect_to trainer_courses_path
  end

  private

  def course_params
    params.require(:course).permit :name, :description, :start_date, :end_date
  end

  def load_course
    @course = Course.find_by id: params[:id]
    @course || render(file: "public/404.html", status: 404, layout: true)
  end
end
