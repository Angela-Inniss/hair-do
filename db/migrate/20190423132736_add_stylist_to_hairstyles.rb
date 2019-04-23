class AddStylistToHairstyles < ActiveRecord::Migration[5.2]
  def change
    add_column :hairstyles, :stylist, :string
  end
end
