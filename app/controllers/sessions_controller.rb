class SessionsController < ApplicationController
  skip_before_action :authorized, only: %i[new create welcome]

  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid email or password'
      redirect_to '/login'
    end
  end

  def login; end

  def logout; end

  def welcome; end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path, notice: 'Logged out successfully'
  end

  def page_requires_login; end
end
