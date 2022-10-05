# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show; end

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

  def edit; end

  def update
    if @task.update(task_params)
      flash[:success] = 'Task was updated successfully'
      redirect_to @task
    else
      render 'new'
    end
  end

  def destroy
    @task.destroy
    redirect_to lists_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :started_at, :finished_at, :justification)
  end
end
