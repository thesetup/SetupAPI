class DropThumbnailsTable < ActiveRecord::Migration
  def down
    drop_table :thumbnails
  end
end
