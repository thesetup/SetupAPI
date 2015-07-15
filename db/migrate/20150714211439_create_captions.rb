class CreateCaptions < ActiveRecord::Migration
  def change
    create_table :captions do |t|
      t.integer :video_id
      t.string :caption

      t.timestamps null: false
    end
  end
end
