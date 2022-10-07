# frozen_string_literal: true

class List < ApplicationRecord
  COLORS = %w[danger success dark light primary secondary warning info].freeze
  PRIORITIES = %w[High Medium Low].freeze

  has_many :tasks, dependent: :destroy
  belongs_to :board

  validates :name, presence: true
  validates :color, presence: true, inclusion: { in: COLORS }
  validates :priority, presence: true, inclusion: { in: PRIORITIES }
end
