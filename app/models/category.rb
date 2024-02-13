class Category < ApplicationRecord
  belongs_to :user
  has_many :purchases
  has_one_attached :icon

  validates :name, presence: true
  validates :icon, presence: true
end
