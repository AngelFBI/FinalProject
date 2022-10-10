# frozen_string_literal: true

class BoardsController < ApplicationController
  before_action :set_board, only: %i[show edit update destroy]

  def index
    @boards = Board.all
    # ActionCable.server.broadcast("board_channel", { data: board_render(@boards) })
    CreateBoardJob.perform_now(board_render(@boards))
  end

  def show
    redirect_to board_lists_path(@board)
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      flash[:success] = 'Board was created successfully'
      redirect_to boards_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @board.update(board_params)
      flash[:success] = 'Board was updated successfully'
      redirect_to boards_path
    else
      render 'new'
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path
  end

  private

  def board_params
    params.require(:board).permit(:name, :visibility)
  end

  def set_board
    @board = Board.find(params[:id])
  end

  def board_render(boards)
    render_to_string(partial: 'card', locals: { boards: boards })
  end
end
