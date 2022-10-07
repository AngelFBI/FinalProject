# frozen_string_literal: true

require 'rails_helper'
require 'shared/board/model_context'

RSpec.describe Board, type: :model do
  include_context 'board model'

  it 'needs a name' do
    board.name = nil
    expect(board.save).to eq(false)
  end

  it 'needs a valid visibility' do
    expect { board.visibility = :custom }.to raise_error(ArgumentError)
  end
end
