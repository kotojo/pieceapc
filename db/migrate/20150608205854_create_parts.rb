class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :api_id
      t.references :computer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
