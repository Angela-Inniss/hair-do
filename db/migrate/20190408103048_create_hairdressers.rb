class CreateHairdressers < ActiveRecord::Migration[5.2]
  def change
    create_table :hairdressers do |t|
      t.string :name
      t.string :address
      t.string :description
      t.string :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
