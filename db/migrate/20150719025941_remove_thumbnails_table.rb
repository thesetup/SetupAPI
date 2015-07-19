class RemoveThumbnailsTable < ActiveRecord::Migration
  def change
    drop_table :thumbnails
  end
end
