# frozen_string_literal: true

require 'rails_helper'
require 'shared/task_history/model_context'

RSpec.describe TaskHistory, type: :model do
  include_context 'task history model'

  it 'should create' do
    expect(task_history.save).to eq(true)
  end
end
