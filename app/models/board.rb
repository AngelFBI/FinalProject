# frozen_string_literal: true

class Board < ApplicationRecord
  # see rubocop documentation for ordering
  # of dsl methods in active record models
  has_many :lists, dependent: :destroy

  enum visibility: { public: 0, private: 1 }, _prefix: true

  validates :name, presence: true
  validates :visibility, presence: true
end
