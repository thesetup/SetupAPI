class AddColumnToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :optional_video_1_url, :string
    add_column :videos, :optional_video_2_url, :string
    add_column :videos, :optional_video_3_url, :string
  end
end
