class AddJustificationToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :justification, :text
  end
end