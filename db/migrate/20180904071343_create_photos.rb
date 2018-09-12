class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :title
      t.text :desciption
      t.boolean :share_mode
      t.attachment :image
      t.references :user, foreign_key: true
      t.references :album, foreign_key: true

      t.timestamps
    end
    add_index :photos, :title
  end
end
