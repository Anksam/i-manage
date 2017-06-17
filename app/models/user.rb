class User < ApplicationRecord

  has_many :incomes
  has_many :expenses
  has_many :income_categories
  has_many :expense_categories

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable,
         :validatable, password_length: 8..128

  validates_presence_of :first_name, :last_name

  def full_name
    self.first_name + " " + self.last_name
  end

end
