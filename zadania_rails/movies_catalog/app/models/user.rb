class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :email, presence: true, email: true
  validates :password, presence: true, confirmation: true, length: { minimum: 5 }

  has_many :opinions

  def admin?
    self.admin == true
  end

  def author?
  end
end
