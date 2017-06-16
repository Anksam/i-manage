class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :expense_category, required: false
  validates :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
