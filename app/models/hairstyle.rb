class Hairstyle < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments
  validates :name, presence: true
  validates :description, presence: true
  #validates :photo_url, presence: true
  validates :video_url, presence: true
  validates :category, presence: true
  mount_uploader :photo, PhotoUploader

  include PgSearch
  pg_search_scope :search_by_category, against: :category
    # using: {
    #   tsearch: { prefix: true } # <-- now `superman batm` will return something!
    # }
end


