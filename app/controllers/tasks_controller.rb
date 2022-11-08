class TasksController < ApplicationController
  def index
    @category = Category.find_by(id: category_id)
    @tasks = @category.tasks.all
  end

  def show
    @task = Task.find(params[:id)

  def new
    @task = Task.new
  end

  def create
    @category = Category.find_by(id: category_id)
    @task = @category.tasks.build(user_params)
  end

  def update
  end

  def destroy
  end

  def show
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:name, :description)
  end


end
