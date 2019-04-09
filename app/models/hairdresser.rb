class Hairdresser < ApplicationRecord
  belongs_to :user, optional: true
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  mount_uploader :photo, PhotoUploader
end
