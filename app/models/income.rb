class Income < ApplicationRecord
  belongs_to :user
  belongs_to :income_category, required: false
  validates :amount, :category_id , :date, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
