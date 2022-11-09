class TasksController < ApplicationController
  before_action :set_category
  def index
    @category = Category.find_by(id: category_id)
    @tasks = @category.tasks.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = @category.tasks.build(task_params)

    if @task.save
      redirect_to categories_path
    else
      render root_path
    end
  end

  def update
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Task has been deleted"
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find_by(params[:category_id])
  end

  def task_params
    params[:task].permit(:name)
  end


end
