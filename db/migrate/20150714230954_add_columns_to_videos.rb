class AddColumnsToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :main, :boolean
    add_column :videos, :caption, :string
    add_column :videos, :thumbnail_url, :string
  end
end
