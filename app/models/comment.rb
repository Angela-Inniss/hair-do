class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :hairstyle
  belongs_to :hairdresser
  validates :content, length: { minimum: 20 }
end
