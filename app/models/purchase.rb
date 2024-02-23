class Purchase < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category

  validates :name, presence: true
  validates :amount, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 1_000_000 }
  validates :category, presence: true
end
