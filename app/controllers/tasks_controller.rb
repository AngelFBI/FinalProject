# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  before_action :get_list, only: %i[new create]

  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = @list.tasks.build
  end

  def create
    @task = @list.tasks.build(task_params)
    if @task.save
      flash[:success] = 'Task was created successfully'
      redirect_to lists_path
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
    params.require(:task).permit(:title, :details,
      :started_at, :finished_at, :justification, :list_id)
  end

  def get_list
    @list = List.find(params[:list_id])
  end
end
