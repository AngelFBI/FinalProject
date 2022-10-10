class CreateBoardJob < ApplicationJob
  queue_as :default

  def perform(boards)
    ActionCable.server.broadcast("board_channel", { data: boards })
  end
end
