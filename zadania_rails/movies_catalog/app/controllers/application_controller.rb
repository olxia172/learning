class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.where(id: session[:user_id]).first if session[:user_id]
  end

  def require_user
    redirect_to login_path, alert: 'You have to be logged in' unless current_user
  end

  def require_admin
    redirect_to root_path, alert: 'You are not an admin' unless current_user.admin?
  end
end
