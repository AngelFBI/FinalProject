# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'dependency' do
  it 'can build children' do
    expect(father_children.build(child).save).to eq(true)
  end

  it 'has multiple children' do
    father_children.build(child).save
    father_children.build(child).save
    expect(father_children.length).to eq(2)
  end

  it 'deletes child children' do
    child_deleted = father_children.build(child)
    child_deleted.save
    id = child_deleted.id
    father.destroy
    expect { find_child(id) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
