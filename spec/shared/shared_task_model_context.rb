# frozen_string_literal: true

RSpec.shared_context 'task model' do
  let(:list) do
    List.create(name: 'Example List', color: 'success', priority: 'Low')
  end

  let(:task) do
    Task.new(title: 'Example', details: 'Task to be done')
  end

  let(:task_with_list) do
    task.list_id = list.id
    task
  end
end
