class User < ApplicationRecord
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
