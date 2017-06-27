class AlterItemsAddPrice < ActiveRecord::Migration[5.0]

  def up
    add_column :items, "price", :decimal, :precision => 6, :scale => 2
  end

  def down
    remove_column :items, "price"
  end

end
