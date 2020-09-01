class AddUserToAlbums < ActiveRecord::Migration[6.0]
  def change
    add_reference :albums, :user, null: false, foreign_key: true
  end
end
