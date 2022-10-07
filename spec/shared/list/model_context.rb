# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_context 'list model' do
  include_context 'board model'

  let(:list) do
    List.create(name: 'Example List',
      color: 'success', priority: 'Low',
      board_id: board_created.id)
  end

  let(:list2) do
    List.create(name: 'Example List 2',
      color: 'danger', priority: 'High',
      board_id: board_created.id)
  end
end
