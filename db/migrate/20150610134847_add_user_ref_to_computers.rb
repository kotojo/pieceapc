class AddUserRefToComputers < ActiveRecord::Migration
  def change
    add_reference :computers, :user, index: true, foreign_key: true, null: false
  end
end
