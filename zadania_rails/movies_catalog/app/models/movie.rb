class Movie < ApplicationRecord
  validates :title, presence: true
  validates :release_date, presence: true
  validates :length, presence: true
  validates :description, presence: true, length: { in: 2..500 }
  validates :types, presence: true
  validates :director, presence: true
  validates :writer, presence: true
  validates :country, presence: true

  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :opinions, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :genres

  attr_reader :youtube_url

  def youtube_url=(new_url)
    self.youtube_id = YoutubeID.from(new_url)
  end
end
