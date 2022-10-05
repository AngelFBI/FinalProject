# frozen_string_literal: true

class AddTimeToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :started_at, :datetime
    add_column :tasks, :finished_at, :datetime
  end
end
