class Income < ApplicationRecord

  belongs_to :user
  belongs_to :income_category, required: false

  has_many :tasks, as: :taskable, dependent: :destroy

  validates :amount, :category_id , :date, presence: true
  validates :amount, numericality: { greater_than: 0 }

end
