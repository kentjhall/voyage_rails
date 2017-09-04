class CreateShippingMethods < ActiveRecord::Migration[5.1]

  def up
    create_table :shipping_methods do |t|
      t.string "name"
      t.integer "cost"

      t.timestamps
    end
  end

  def down
    drop_table :shipping_methods
  end

end
