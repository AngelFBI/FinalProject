# frozen_string_literal: true

class List < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :board

  enum color: { danger: 0, success: 1, warning: 2, info: 3,
                primary: 4, secondary: 5 }, _prefix: true
  enum priority: { Low: 0, Medium: 1, High: 3 }, _prefix: true

  validates :name, presence: true
  validates :color, presence: true
  validates :priority, presence: true
end
