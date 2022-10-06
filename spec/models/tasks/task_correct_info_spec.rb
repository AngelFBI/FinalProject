# frozen_string_literal: true

require 'rails_helper'
require 'shared/shared_task_model_context'

RSpec.describe Task, type: :model do
  include_context 'task model'

  it 'can be save' do
    expect(task_with_list.save).to eq(true)
  end

  it 'can save with started_at' do
    task_with_list.started_at = Time.zone.now
    expect(task_with_list.save).to eq(true)
  end

  it 'can save with started_at and finished_at' do
    task_with_list.started_at = Time.zone.now
    task_with_list.finished_at = Time.zone.now
    expect(task_with_list.save).to eq(true)
  end

  it 'can save with started_at, finished_at and justification' do
    task_with_list.started_at = Time.zone.now
    task_with_list.finished_at = Time.zone.now
    task_with_list.justification = 'easy task'
    expect(task_with_list.save).to eq(true)
  end
end
