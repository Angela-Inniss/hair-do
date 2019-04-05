class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :hairstyle
  validates :content, presence: true
end
