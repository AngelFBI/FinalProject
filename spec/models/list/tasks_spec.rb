# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  include_context 'list model'
  let(:task) do
    { title: 'Example', details: 'Some details' }
  end

  it 'can build tasks' do
    expect(list.tasks.build(task).save).to eq(true)
  end

  it 'has multiple tasks' do
    list.tasks.build(task).save
    list.tasks.build(task).save
    expect(list.tasks.length).to eq(2)
  end

  it 'deletes child tasks' do
    task_deleted = list.tasks.build(task)
    task_deleted.save
    id = task_deleted.id
    list.destroy
    expect { Task.find(id) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
