# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_context 'list model' do
  include_context 'board model'

  let(:list) do
    List.new(name: 'Example List',
             color: 'warning', priority: 'Medium',
             board_id: board_created.id)
  end

  let(:list_created) do
    List.create(name: 'Example List Created',
                color: 'success', priority: 'Low',
                board_id: board_created.id)
  end

  let(:list_created2) do
    List.create(name: 'Example List 2',
                color: 'danger', priority: 'High',
                board_id: board_created.id)
  end
end
