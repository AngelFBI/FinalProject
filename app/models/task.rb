class Task < ApplicationRecord
  validates :title, presence: true
  validates :details, length: { maximum: 500 }
end
