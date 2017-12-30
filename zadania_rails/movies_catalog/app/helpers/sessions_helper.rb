module SessionsHelper
  def user_guest?
    current_user.nil?
  end

  def user_logged_in?
    current_user
  end

  def user_admin?
    user_logged_in? && current_user.admin?
  end
end
