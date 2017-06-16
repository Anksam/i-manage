class Expense < ApplicationRecord
  belongs_to :user
  validates :amount, presence: true
  validates :price, numericality: { greater_than: 0 }
end
