class ChangeLists < ActiveRecord::Migration[6.1]
  def change
    change_column :lists, :color, :integer
    change_column :lists, :priority, :integer
  end
end
