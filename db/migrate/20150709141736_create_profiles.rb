class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :profiler_id
      t.integer :profilee_id

      t.timestamps null: false
    end
  end
end
