# frozen_string_literal: true

class RemoveDetailsFromTasks < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :details, :text
  end
end
