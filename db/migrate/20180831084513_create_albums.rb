class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :description
      t.boolean :share_mode

      t.timestamps
    end
    add_index :albums, :title
  end
end
