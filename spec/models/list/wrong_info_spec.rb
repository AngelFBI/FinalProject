# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  include_context 'list model'

  it 'needs a name' do
    list.name = nil
    expect(list.save).to eq(false)
  end

  it 'needs a color' do
    list.color = nil
    expect(list.save).to eq(false)
  end

  it 'needs a priority' do
    list.priority = nil
    expect(list.save).to eq(false)
  end

  it 'needs a valid color' do
    expect { list.color = :custom }.to raise_error(ArgumentError)
  end

  it 'needs a valid priority' do
    expect { list.priority = :custom }.to raise_error(ArgumentError)
  end
end
