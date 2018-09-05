class AddColumnToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :image, :string
    add_reference :photos, :album, foreign_key: true
  end
end
