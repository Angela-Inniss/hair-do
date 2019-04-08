class AddPhotoToHairdressers < ActiveRecord::Migration[5.2]
  def change
    add_column :hairdressers, :photo_url, :string
  end
end
