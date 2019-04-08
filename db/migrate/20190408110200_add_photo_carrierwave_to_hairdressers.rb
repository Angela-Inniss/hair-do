class AddPhotoCarrierwaveToHairdressers < ActiveRecord::Migration[5.2]
  def change
    add_column :hairdressers, :photo, :string
  end
end
