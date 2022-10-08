# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  before_action :list, only: %i[index new create]
  before_action :shallow_list, only: %i[update destroy]

  def index
    @tasks = @list.tasks
  end

  def show; end

  def new
    @task = @list.tasks.build
    @lists = @list.board.lists
  end

  def create
    @task = @list.tasks.build(task_params)
    if @task.save
      flash[:success] = 'Task was created successfully'
      redirect_to board_lists_path(@list.board_id)
    else
      render 'new'
    end
  end

  def edit
    @lists = @task.list.board.lists
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'Task was updated successfully'
      redirect_to @task
    else
      render 'new'
    end
  end

  def destroy
    board = @task.list.board_id
    @task.destroy
    redirect_to board_lists_path(board)
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details,
                                 :started_at, :finished_at, :justification, :list_id)
  end

  def list
    @list = List.find(params[:list_id])
  end

  def shallow_list
    @list = @task.list
  end
end
