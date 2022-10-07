# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  include_context 'list model'

  it 'can access board name' do
    expect(list.board.name).to eq(board_created.name)
  end
end
