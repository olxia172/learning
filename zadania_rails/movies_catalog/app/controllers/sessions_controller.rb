class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to movies_path, notice: 'You successfully loged in'
    else
      redirect_to login_path, alert: 'Email or password is invalid'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to movies_path, notice: 'You successfully loged out'
  end
end
