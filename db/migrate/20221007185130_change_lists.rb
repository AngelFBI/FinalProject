# frozen_string_literal: true

class ChangeLists < ActiveRecord::Migration[6.1]
  def up
    change_column :lists, :color, :integer
    change_column :lists, :priority, :integer
  end

  def down
    change_column :lists, :color, :string
    change_column :lists, :priority, :string
  end
end
