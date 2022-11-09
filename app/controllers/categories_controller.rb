class CategoriesController < ApplicationController
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
      redirect_to @category
    else
      render 'new'
    end
  end



  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Category has been deleted"
    redirect_to categories_path
  end
  private

  def category_params
    params.require(:category).permit(:name, :description, tasks_attributes:[:name])
  end
end
