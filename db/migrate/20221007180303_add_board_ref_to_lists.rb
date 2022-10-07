# frozen_string_literal: true

class AddBoardRefToLists < ActiveRecord::Migration[6.1]
  def change
    add_reference :lists, :board, foreign_key: true
  end
end
