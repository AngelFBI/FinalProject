# frozen_string_literal: true

class Task < ApplicationRecord
  has_rich_text :details

  validates :title, presence: true
end
