class ChangeColumnPhoto < ActiveRecord::Migration[5.1]
  def up
    change_column :photos, :album_id, :integer
  end

  def down
    change_column :photos, :album_id, :integer
  end
end
