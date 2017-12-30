class Opinion < ApplicationRecord
  validates :author, presence: true, length: { minimum: 3, maximum: 30 }
  validates :rate, presence: true, numericality: true, range: true
  validates :body, presence: true, length: { minimum: 5, maximum: 500 }

  belongs_to :movie
  belongs_to :user
end
