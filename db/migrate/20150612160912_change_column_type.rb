class ChangeColumnType < ActiveRecord::Migration
  def change
    change_column :computers, :price, :float
  end
end
