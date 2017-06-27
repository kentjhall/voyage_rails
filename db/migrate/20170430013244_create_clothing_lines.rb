class CreateClothingLines < ActiveRecord::Migration[5.0]

  def up
    create_table :clothing_lines do |t|
      t.string "name"
      t.boolean "available", :default => false

      t.timestamps
    end
  end

  def down
    drop_table :clothing_lines
  end

end
