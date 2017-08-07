class AlterItemsAddImgPath < ActiveRecord::Migration[5.1]

  def up
    add_column :items, "img_path", :string
  end

  def down
    remove_column :items, "img_path"
  end

end
