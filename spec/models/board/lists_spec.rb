# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Board, type: :model do
  include_context 'board model'

  let(:list) do
    { name: 'Example', color: :success, priority: :High }
  end

  it 'can build lists' do
    expect(board.lists.build(list).save).to eq(true)
  end

  it 'has multiple lists' do
    board.lists.build(list).save
    board.lists.build(list).save
    expect(board.lists.length).to eq(2)
  end

  it 'deletes child lists' do
    list_deleted = board.lists.build(list)
    list_deleted.save
    id = list_deleted.id
    board.destroy
    expect { List.find(id) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
