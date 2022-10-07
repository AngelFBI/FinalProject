# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  include_context 'task model'

  it 'can access list name' do
    expect(task_created.list.name).to eq(list_created.name)
  end
end
