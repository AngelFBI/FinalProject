# frozen_string_literal: true

class Task < ApplicationRecord
  has_rich_text :details
  belongs_to :list
  has_many :task_histories

  validates :title, presence: true
  validates :list_id, presence: true
  validates_with TasksValidator

  after_save :add_task_history

  def doing_time
    doing_time_in_seconds / 1.hour if doing_time_in_seconds
  end

  private

  def doing_time_in_seconds
    (finished_at - started_at).to_i
  rescue StandardError
    nil
  end

  def add_task_history
    TaskHistory.create(list: list.name, task_id: id) unless list_id == list_id_was
  end
end
