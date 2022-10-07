# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Board, type: :model do
  include_context 'board model'

  it 'can be save public board' do
    expect(board.save).to eq(true)
  end

  it 'can be save private board' do
    expect(board_private.save).to eq(true)
  end

  it 'can access its visibility' do
    expect(board.visibility).to eq('public')
  end
end
