class TasksController < ApplicationController
  before_action :set_task, only: [ :show, :edit, :update ]

  def index
    @tasks = Task.all.current_tasks
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
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
    @new_task = Task.new(task_params)
    @new_task.created_at = @task.updated_at
    @new_task.current_task_id = @task.id
    if @task.update(task_params)
      flash[:success] = 'Task was created successfully'
      @new_task.save
      redirect_to @task
    else
      render 'new'
    end
  end

  def destroy
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
