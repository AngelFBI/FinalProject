class Task < ApplicationRecord
  has_rich_text :details

  validates :title, presence: true
  validates :details, length: { maximum: 500 }
end
