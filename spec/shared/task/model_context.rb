# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_context 'task model' do
  let(:list) do
    List.create(name: 'Example List', color: 'success', priority: 'Low')
  end

  let(:list2) do
    List.create(name: 'Example List 2', color: 'danger', priority: 'High')
  end

  let(:task) do
    Task.new(title: 'Example', details: 'Task to be done', list_id: list.id)
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