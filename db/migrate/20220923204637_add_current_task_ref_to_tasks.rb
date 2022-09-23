class AddCurrentTaskRefToTasks < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :current_task, foreign_key: { to_table: :tasks }
  end
end
