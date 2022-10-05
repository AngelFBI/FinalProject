# frozen_string_literal: true

class Task < ApplicationRecord
  has_rich_text :details

  validates :title, presence: true

  def doing_time
    doing_time_in_seconds / 1.hour if doing_time_in_seconds
  end

  private

  def doing_time_in_seconds
    (finished_at - started_at).to_i
  rescue StandardError
    nil
  end
end
