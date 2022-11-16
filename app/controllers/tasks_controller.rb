class TasksController < ApplicationController
  before_action :set_category
  before_action :set_task, except: [:create]
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

  def complete
    @task.update_attribute(:completed_at, Time.now)
    redirect_to categories_path, notice: 'Task completed'
  end

  def destroy
    if @task.destroy
      flash[:notice] = 'Task has been deleted'
      redirect_to categories_path
    else
      flash[:error] = 'Task failed to be deleted'
      redirect_to categories_path
    end
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
    # @category = Category.find_by(params[:category])
  end

  def set_task
    @task = @category.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name)
  end
end
