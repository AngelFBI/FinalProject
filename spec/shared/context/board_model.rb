# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_context 'board model' do
  let(:board) do
    Board.new(name: 'Example Board', visibility: :public)
  end

  let(:board_private) do
    board.visibility = :private
    board
  end

  let(:board_created) do
    board.save
    board
  end
end
