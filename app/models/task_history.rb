# frozen_string_literal: true

class TaskHistory < ApplicationRecord
  belongs_to :task

  validates :list, presence: true
end
