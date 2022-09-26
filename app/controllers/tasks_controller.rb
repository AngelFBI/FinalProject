class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :details))
    if @task.save
      flash[:success] = 'Task was created successfully'
      redirect_to tasks_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'Task was created successfully'
      redirect_to @task
    else
      render 'new'
    end
  end

  def destroy
  end
end
