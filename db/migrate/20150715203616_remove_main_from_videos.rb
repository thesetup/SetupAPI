class RemoveMainFromVideos < ActiveRecord::Migration
  def change
    remove_column :videos, :main
      
  end
end
