class Movie < ApplicationRecord
  validates :title, presence: true
  validates :release_date, presence: true
  validates :length, presence: true
  validates :description, presence: true, length: { in: 200..1000 }
  validates :types, presence: true
  validates :director, presence: true
  validates :writer, presence: true
  validates :country, presence: true
  has_many :opinions
end
