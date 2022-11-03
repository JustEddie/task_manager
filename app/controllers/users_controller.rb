class UsersController < ApplicationController
  skip_before_action :authorized, only: %i[new create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Successfully created account'
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      give_token
    else
      redirect_to home_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
end
