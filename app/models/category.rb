class Category < ApplicationRecord
  belongs_to :user
  has_many :purchases
  has_one_attached :icon

  validates :name, presence: true
  validates :icon, presence: true
  validates :amount, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 1000000 }
end
