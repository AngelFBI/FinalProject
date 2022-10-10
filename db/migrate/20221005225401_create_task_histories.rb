# frozen_string_literal: true

class CreateTaskHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :task_histories do |t|
      t.string :list
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
