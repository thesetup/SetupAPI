class ChangeVideoMainColumnToDefaultTrue < ActiveRecord::Migration
  def change
    change_column_default :videos, :main, true
  end
end
