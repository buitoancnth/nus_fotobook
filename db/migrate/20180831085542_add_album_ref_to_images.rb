class AddAlbumRefToImages < ActiveRecord::Migration[5.1]
  def change
    add_reference :images, :album, foreign_key: true
  end
end
