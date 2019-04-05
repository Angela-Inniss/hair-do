class CreateHairstyles < ActiveRecord::Migration[5.2]
  def change
    create_table :hairstyles do |t|
      t.string :name
      t.string :description
      t.string :category
      t.string :photo_url
      t.string :video_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
