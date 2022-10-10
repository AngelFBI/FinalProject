# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TaskHistory, type: :model do
  include_context 'task history model'

  it 'needs a list name' do
    task_history.list = nil
    expect(task_history.save).to eq(false)
  end

  it 'needs a task_id' do
    task_history.task_id = nil
    expect(task_history.save).to eq(false)
  end
end
