class Hairstyle < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :name, presence: true
  #validates :description, presence: true
  #validates :photo_url, presence: true
  #validates :video_url, presence: true
 # validates :category, presence: true
 #mount_uploader :photo, PhotoUploader
end
