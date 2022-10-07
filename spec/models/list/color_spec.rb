# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  include_context 'list model'

  it 'can be save warning color' do
    expect(list.save).to eq(true)
  end

  it 'can be save danger color' do
    list.color = :danger
    expect(list.save).to eq(true)
  end

  it 'can be save success color' do
    list.color = :success
    expect(list.save).to eq(true)
  end

  it 'can be save info color' do
    list.color = :info
    expect(list.save).to eq(true)
  end

  it 'can be save secondary color' do
    list.color = :secondary
    expect(list.save).to eq(true)
  end

  it 'can be save primary color' do
    list.color = :primary
    expect(list.save).to eq(true)
  end
end
