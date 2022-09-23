class Task < ApplicationRecord
  has_many :edited_tasks, class_name: "Task",
    foreign_key: "current_task_id"
  belongs_to :current_task, class_name: "Task", optional: true

  scope :current_tasks, ->{ where(current_task_id: nil) }
  validates :title, presence: true
  validates :details, length: { maximum: 500 }
end
