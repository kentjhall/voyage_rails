class AlterItemsRemoveImgPathsAddNumImgs < ActiveRecord::Migration[5.1]

  def up
    remove_column :items, "img_paths"
    add_column :items, "num_imgs", :integer
  end

  def down
    remove_column :items, "num_imgs"
    add_column :items, "img_paths", :string
  end

end
