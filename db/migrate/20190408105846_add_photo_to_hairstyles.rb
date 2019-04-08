class AddPhotoToHairstyles < ActiveRecord::Migration[5.2]
  def change
    add_column :hairstyles, :photo, :string
  end
end
