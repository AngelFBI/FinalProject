# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  include_context 'task model'

  it 'can be save' do
    expect(task.save).to eq(true)
  end

  it 'can save with started_at' do
    task.started_at = Time.zone.now
    expect(task.save).to eq(true)
  end

  it 'can save with started_at and finished_at' do
    task.started_at = Time.zone.now
    task.finished_at = Time.zone.now
    expect(task.save).to eq(true)
  end

  it 'can save with started_at, finished_at and justification' do
    task.started_at = Time.zone.now
    task.finished_at = Time.zone.now
    task.justification = 'easy task'
    expect(task.save).to eq(true)
  end
end
