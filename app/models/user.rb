class User < ApplicationRecord

  has_many :incomes, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :income_categories, dependent: :destroy
  has_many :expense_categories, dependent: :destroy

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
