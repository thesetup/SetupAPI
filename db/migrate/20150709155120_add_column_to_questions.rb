class AddColumnToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :profile_id, :integer
  end
end
