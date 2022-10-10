# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  include_context 'list model'

  it 'can be save Medium priority' do
    expect(list.save).to eq(true)
  end

  it 'can be save Low priority' do
    list.priority = :Low
    expect(list.save).to eq(true)
  end

  it 'can be save High priority' do
    list.priority = :High
    expect(list.save).to eq(true)
  end
end
