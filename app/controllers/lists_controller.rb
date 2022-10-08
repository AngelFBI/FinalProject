# frozen_string_literal: true

class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update destroy]
  before_action :board, only: %i[index new create]
  before_action :shallow_board, only: %i[update destroy]

  def index
    @lists = @board.lists
  end

  def show
    redirect_to list_tasks_path(@list)
  end

  def new
    @list = @board.lists.build
  end

  def create
    @list = @board.lists.build(list_params)
    if @list.save
      flash[:success] = 'List was created successfully'
      redirect_to board_lists_path(@board)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @list.update(list_params)
      flash[:success] = 'List was updated successfully'
      redirect_to board_lists_path(@board)
    else
      render 'new'
    end
  end

  def destroy
    @list.destroy
    redirect_to board_lists_path(@board)
  end

  private

  def list_params
    params.require(:list).permit(:name, :color, :priority)
  end

  def set_list
    @list = List.find(params[:id])
  end

  def board
    @board = Board.find(params[:board_id])
  end

  def shallow_board
    @board = @list.board_id
  end
end
