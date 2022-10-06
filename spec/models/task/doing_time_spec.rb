# frozen_string_literal: true

require 'rails_helper'
require 'shared/task/model_context'

RSpec.describe Task, type: :model do
  include_context 'task model'

  it 'has doing time of 24' do
    expect(task_doing_time.doing_time).to eq(24)
  end

  it "can't use doing time" do
    expect(task.doing_time).to eq(nil)
  end
end