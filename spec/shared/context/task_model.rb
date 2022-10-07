# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_context 'task model' do
  include_context 'list model'

  let(:task) do
    Task.new(title: 'Example', details: 'Task to be done', list_id: list_created.id)
  end

  let(:task_doing_time) do
    task.started_at = Time.zone.now - 1.day
    task.finished_at = Time.zone.now
    task
  end

  let(:task_created) do
    task.save
    task
  end
end
