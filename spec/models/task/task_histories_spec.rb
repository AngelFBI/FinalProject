# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  include_context 'task model'

  it 'creates a new task history with create' do
    expect(task_created.task_histories.length).to eq(1)
  end

  it 'creates a new task history with update' do
    task_created.list_id = list_created2.id
    task_created.save
    expect(task_created.task_histories.length).to eq(2)
  end

  it "doesn't create a new task history" do
    task_created.list_id = nil
    task_created.save
    task_created.list_id = list_created2.id
    task_created.finished_at = Time.zone.now
    task_created.save
    expect(task_created.task_histories.length).to eq(1)
  end

  it 'deletes dependencies' do
    id = task_created.id
    task_created.destroy
    expect { TaskHistory.find(id) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
