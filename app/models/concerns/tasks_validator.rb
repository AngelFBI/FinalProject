class TasksValidator < ActiveModel::Validator
  def validate(record)
    if record.started_at.nil? && !record.finished_at.nil?
      record.errors.add(:finished_at, "need started at first")
    end

    if record.finished_at.nil? && !record.justification.nil?
      record.errors.add(:justification, "need finished at first")
    end
  end
end
