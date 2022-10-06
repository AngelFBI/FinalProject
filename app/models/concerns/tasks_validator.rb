# frozen_string_literal: true

class TasksValidator < ActiveModel::Validator
  def validate(record)
    need_finished_at if record.finished_at.nil? && !record.justification.nil?

    return if record.finished_at.nil?

    if record.started_at.nil?
      need_started_at
    elsif record.finished_at < record.started_at
      finished_at_lower_than
    end
  end

  private

  def need_finished_at
    record.errors.add(:justification, 'need finished_at first')
  end

  def need_started_at
    record.errors.add(:finished_at, 'need started_at first')
  end

  def finished_at_lower_than
    record.errors.add(:finished_at, "can't be lower than started_at")
  end
end
