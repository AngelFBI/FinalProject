# frozen_string_literal: true

class AddListRefToTasks < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :list, foreign_key: true
  end
end
