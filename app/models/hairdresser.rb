class Hairdresser < ApplicationRecord
  belongs_to :user, optional: true
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :address, presence: true
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
