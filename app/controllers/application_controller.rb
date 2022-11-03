class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?
  helper_method :login 
  helper_method :logout

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to '/welcome' unless logged_in?
  end

  # def login
  #   @user = User.find_by(email: params[:email])
  #   if @user.password == params[:password]
  #     # give_token
  #     sessions[:user.id] = @user.id
  #     redirect_to '/welcome', notice: 'Logged in successfully'
  #   else
  #     flash.now[:alert] = 'Invalid email or password'
  #     redirect_to login_path
  #   end
  # end

  # def logout
  #   session.delete(:user_id)
  #   @current_user = nil
  # end
end
