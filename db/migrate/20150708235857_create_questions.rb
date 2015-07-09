class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|

      t.string :name
      t.string :email
      t.integer :birthyear
      t.string :gender
      t.string :orientation
      t.string :occupation
      t.string :location

      t.timestamps null: false
    end
  end
end
