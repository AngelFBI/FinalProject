class CreateBoardJob < ApplicationJob
  queue_as :default

  def perform(board)
    board_render = render(partial: 'boards/card', locals: { board: board })
    ActionCable.server.broadcast("board_channel", board_body: board_render)
  end
end
