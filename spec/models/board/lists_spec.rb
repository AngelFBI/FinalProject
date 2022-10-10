# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Board, type: :model do
  include_context 'board model'

  let(:child) do
    { name: 'Example', color: :success, priority: :High }
  end

  let(:father) do
    board
  end

  let(:father_children) do
    board.lists
  end

  def find_child(id)
    List.find(id)
  end

  include_examples 'dependency'
end
