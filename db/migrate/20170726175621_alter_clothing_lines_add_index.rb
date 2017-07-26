class AlterClothingLinesAddIndex < ActiveRecord::Migration[5.1]

  def up
    add_column :clothing_lines, "index", :integer
  end

  def down
    remove_column :clothing_lines, "index"
  end

end
