class CreateItems < ActiveRecord::Migration[5.0]

  def up
    create_table :items do |t|
      t.integer "clothing_line_id"
      t.string "name"
      t.integer "stock", :default => 0
      t.boolean "available", :default => false

      t.timestamps
    end
    add_index :items, "clothing_line_id"
  end

  def down
    drop_table :items
  end

end
