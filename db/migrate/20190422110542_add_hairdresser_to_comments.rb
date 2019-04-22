class AddHairdresserToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :hairdresser, foreign_key: true
  end
end
