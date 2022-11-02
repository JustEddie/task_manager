class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order("created_at DESC")
  end

  def new
    @category = Category.new
  end


  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render 'new'
    end
    # @category.save!
    # redirect_to @category
  end

  def show
    @category = Category.find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:name, :description, :user_id)
  end
end
