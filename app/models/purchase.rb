class Purchase < ApplicationRecord
  belongs_to :author, calss_name: 'User'
  has_many :purchase_categories
  has_many :categories, through: :purchase_categories

  validates :name, presence: true
  validates :amount, presence: true
  validates :category, presence: true
end
