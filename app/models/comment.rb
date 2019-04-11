class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :hairstyle
  belongs_to :hairdresser
  validates :content, presence: true
  validates :content, length: { minimum: 20 }
end
