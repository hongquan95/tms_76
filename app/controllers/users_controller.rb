class UsersController < ApplicationController
  before_action :load_user, only: %i(show edit update)
  before_action :logged_in_user, except: %i(destroy update create)
  before_action :correct_user, only: %i(update edit destroy)

  def index
    @users = User.paginate page: params[:page]
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t ".welcome"
    else
      render :new
    end
    redirect_to users_path
  end

  def edit; end

  def update
    return render :edit unless @user.update_attributes user_params
    flash[:success] = t ".notice"
    redirect_to users_path
  end

  def destroy
    if @user.destroy
      flash[:success] = t ".notice"
    else
      flash[:danger] = t ".fail"
    end
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :school, :graduation
  end

  def correct_user
    load_user
    redirect_to root_url unless current_user?(@user) || current_user.admin?
  end

  def load_user
    @user = User.find_by id: params[:id]
    @user || render(file: "public/404.html", status: 404, layout: true)
  end
end
