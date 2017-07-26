class AlterItemsAddProductId < ActiveRecord::Migration[5.1]

  def up
    add_column :items, "product_id", :string
  end

  def down
    remove_column :items, "product_id"
  end

end
