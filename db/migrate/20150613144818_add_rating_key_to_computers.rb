class AddRatingKeyToComputers < ActiveRecord::Migration
  def change
    add_column :computers, :rating, :integer
  end
end
