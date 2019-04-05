class SavedHairstyle < ApplicationRecord
  belongs_to :user
  belongs_to :hairstyle
end
