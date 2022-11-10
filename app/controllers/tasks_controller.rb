class TasksController < ApplicationController
  before_action :set_category
  def index
    # @category = Category.find_by(id: category_id)
    @tasks = @category.tasks.all
  end

  def show
    @task = Task.find(params[:id])
    # @task = @category.tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = @category.tasks.create(task_params)

    if @task.save
      # redirect_to categories_path
      redirect_to categories_path
    else
      render root_path
    end
  end


  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Task has been deleted"
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
    # @category = Category.find_by(params[:category])
  end

  def task_params
    params.require(:task).permit(:name)
  end


end
