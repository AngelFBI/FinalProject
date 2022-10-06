# frozen_string_literal: true

require 'rails_helper'
require 'shared/shared_task_model_context'

RSpec.describe Task, type: :model do
  include_context 'task model'
  before do
    task_with_list.save
  end

  it 'creates a new task history with create' do
    expect(task_with_list.task_histories.length).to eq(1)
  end

  it 'creates a new task history with update' do
    task_with_list.list_id = list2.id
    task_with_list.save
    expect(task_with_list.task_histories.length).to eq(2)
  end

  it "doesn't create a new task history" do
    task_with_list.list_id = nil
    task_with_list.save
    task_with_list.list_id = list2.id
    task_with_list.finished_at = Time.zone.now
    task_with_list.save
    expect(task_with_list.task_histories.length).to eq(1)
  end
end
