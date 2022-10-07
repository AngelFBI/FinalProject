# frozen_string_literal: true

class Board < ApplicationRecord
  validates :name, presence: true
  validates :visibility, presence: true

  has_many :lists, dependent: :destroy

  enum visibility: { public: 0, private: 1 }, _prefix: true
end
