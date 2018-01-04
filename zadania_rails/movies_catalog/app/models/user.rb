class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :email, presence: true, email: true
  validates :password, presence: true, confirmation: true, length: { minimum: 5 }

  has_many :opinions
  has_many :reviews
  has_many :movies

  def admin?
    self.admin == true
  end

  def author?(review)
    self.id == review.user_id
  end
end
