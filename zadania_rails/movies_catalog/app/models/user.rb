class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :email, presence: true, email: true
  validates :password, presence: true, confirmation: true, length: { minimum: 5 }
end
