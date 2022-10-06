# frozen_string_literal: true

RSpec.shared_context 'task model' do
  let(:list) do
    List.create(name: 'Example List', color: 'success', priority: 'Low')
  end

  let(:list2) do
    List.create(name: 'Example List 2', color: 'danger', priority: 'High')
  end

  let(:task) do
    Task.new(title: 'Example', details: 'Task to be done')
  end

  let(:task_with_list) do
    task.list_id = list.id
    task
  end

  let(:task_doing_time) do
    task_with_list.started_at = Time.zone.now - 1.day
    task_with_list.finished_at = Time.zone.now
    task_with_list
  end
end
