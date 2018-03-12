class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include UsersHelper

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t ".please"
      redirect_to login_url
    end
  end

  def verify
    unless current_user.admin? || current_user.trainer?
      redirecto_to root_url
      flash[:danger] = t ".cantaccess"
    end
  end
end
