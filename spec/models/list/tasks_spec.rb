# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  include_context 'list model'

  let(:child) do
    { title: 'Example', details: 'Some details' }
  end

  let(:father) do
    list
  end

  let(:father_children) do
    list.tasks
  end

  def find_child(id)
    Task.find(id)
  end

  include_examples 'dependency'
end
