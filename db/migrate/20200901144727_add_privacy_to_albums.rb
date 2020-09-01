class AddPrivacyToAlbums < ActiveRecord::Migration[6.0]
  def change
    add_column :albums, :privacy, :boolean, default: false
  end
end
