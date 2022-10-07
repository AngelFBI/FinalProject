# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_context 'task history model' do
  include_context 'task model'
  let(:task_history) do
    TaskHistory.new(task_id: task_created.id, list: task_created.list.name)
  end
end
