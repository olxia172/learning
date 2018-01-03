class Review < ApplicationRecord
  validates :rate, presence: true, numericality: true, range: true
  validates :body, presence: true, length: { minimum: 50, maximum: 1000 }

  belongs_to :movie
  belongs_to :user
end
