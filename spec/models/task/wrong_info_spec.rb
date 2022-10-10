# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  include_context 'task model'

  it 'needs list_id' do
    task.list_id = nil
    expect(task.save).to eq(false)
  end

  context 'with list_id' do
    it 'needs a title' do
      task.title = nil
      expect(task.save).to eq(false)
    end

    it "can't save without first started_at" do
      task.finished_at = Time.zone.now
      expect(task.save).to eq(false)
    end

    it "can't save without first finished_at" do
      task.justification = 'impossible task'
      expect(task.save).to eq(false)
    end

    it 'needs finished_at to be higher than started_at' do
      task.started_at = Time.zone.now
      task.finished_at = Time.zone.now - 1.day
      expect(task.save).to eq(false)
    end
  end
end
