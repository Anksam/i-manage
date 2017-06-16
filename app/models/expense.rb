class Expense < ApplicationRecord
  belongs_to :user
  validates :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
