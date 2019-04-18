class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :hairstyle
  belongs_to :hairdresser, optional: true
  validates :content, length: { minimum: 20 }
end
