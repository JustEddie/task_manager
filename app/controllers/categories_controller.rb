class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]
  def index
    @user = User.find_by(id: session[:user_id])
    @categories = @user.categories.all
    # @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @user = User.find_by(id: session[:user_id])
    @category = @user.categories.build(category_params)

    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
    # @category = Category.find(params[:id])
  end

  def update
    # @category = Category.find(params[:id])
      if @category.update(category_params)
        redirect_to categories_path
      else
        render 'edit'
      end
  end

  def destroy
    # @category = Category.find(params[:id])
    @category.tasks.each do |task|
      task.destroy
    end
    @category.destroy
    flash[:notice] = 'Category has been deleted'
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
  def category_params
    params.require(:category).permit(:name, :description)
  end
end
