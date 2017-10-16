class AlterItemsAddBlackTextOption < ActiveRecord::Migration[5.1]

  def up
    add_column :items, "black_text", :boolean, :default => false
  end

  def down
    remove_column :items, "black_text"
  end

end
