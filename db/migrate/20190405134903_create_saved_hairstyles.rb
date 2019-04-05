class CreateSavedHairstyles < ActiveRecord::Migration[5.2]
  def change
    create_table :saved_hairstyles do |t|
      t.references :user, foreign_key: true
      t.references :hairstyle, foreign_key: true

      t.timestamps
    end
  end
end
