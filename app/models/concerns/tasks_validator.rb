# frozen_string_literal: true

class TasksValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add(:finished_at, 'need started at first') if record.started_at.nil? && !record.finished_at.nil?

    record.errors.add(:justification, 'need finished at first') if record.finished_at.nil? && !record.justification.nil?
  end
end
