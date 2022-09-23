class TasksController < ApplicationController
  before_action :set_task, only: [ :show, :edit ]

  def index
    @tasks = Task.all
  end

  def show
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
  end

  def destroy
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end
end
