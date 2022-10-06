# frozen_string_literal: true

require 'rails_helper'
require 'shared/shared_task_model_context'

RSpec.describe Task, type: :model do
  include_context 'task model'

  it 'needs list_id' do
    expect(task.save).to eq(false)
  end

  context 'with list_id' do
    it "can't save without first started_at" do
      task_with_list.finished_at = Time.zone.now
      expect(task_with_list.save).to eq(false)
    end

    it "can't save without first finished_at" do
      task_with_list.justification = 'impossible task'
      expect(task_with_list.save).to eq(false)
    end
  end
end
