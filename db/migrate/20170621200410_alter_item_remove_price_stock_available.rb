class AlterItemRemovePriceStockAvailable < ActiveRecord::Migration[5.0]

  def up
    remove_column :items, "stock"
    remove_column :items, "available"
  end

  def down
    add_column :items, "available", :boolean, :default => true
    add_column :items, "stock", :integer, :default => 0
  end

end
