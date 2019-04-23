class AddLocationToHairstyles < ActiveRecord::Migration[5.2]
  def change
    add_column :hairstyles, :location, :string
  end
end
