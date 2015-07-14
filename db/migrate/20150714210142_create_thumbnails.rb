class CreateThumbnails < ActiveRecord::Migration
  def change
    create_table :thumbnails do |t|
      t.integer :video_id
      t.string :caption
      t.string :thumbnail_url

      t.timestamps null: false
    end
  end
end
