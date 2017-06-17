class IncomeCategory < ApplicationRecord

  belongs_to :user
  has_many :incomes
  validates :category_name, presence: true, length: { minimum:5, maximum:15 }
  validates :description, presence: true, length: { minimum:80, maximum:500 }

end
