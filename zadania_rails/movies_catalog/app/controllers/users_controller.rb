class UsersController < ApplicationController
  def index
    redirect_to '/signup'
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if find_user_email_in_db(@user.email)
      redirect_to signup_path, alert: 'Email is already used'
    else
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: 'You successfully signed in'
      else
        flash.now.alert = 'Something went wrong. Try again'
        render 'users/new'
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def find_user_email_in_db(email)
    !User.where(email: email).empty?
  end
end
