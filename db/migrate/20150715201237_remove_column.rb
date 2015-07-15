class RemoveColumn < ActiveRecord::Migration
  def down
    remove_column :videos, :main
    remove_column :videos, :optional_video_1_url
    remove_column :videos, :optional_video_2_url
    remove_column :videos, :optional_video_3_url
  end
end
