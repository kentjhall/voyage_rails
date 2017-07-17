class AlterClothingLinesAndItemsAddImagePaths < ActiveRecord::Migration[5.0]

  def up
    add_column :clothing_lines, "img_path", :string
    add_column :items, "img_paths", :string
  end

  def down
    remove_column :items, "img_paths"
    remove_column :clothing_lines, "img_path"
  end

end
