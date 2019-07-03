class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :title
      t.string :description
      t.text :link
      t.integer :tabPhoto_id
      t.string :tabPhoto_type
      t.timestamps
    end
    add_index :photos, [:tabPhoto_type, :tabPhoto_id]
  end
end



