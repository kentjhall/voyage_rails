class AlterClothingLineAddSlug < ActiveRecord::Migration[5.1]

  def change
    add_column :clothing_lines, :slug, :string
    add_index :clothing_lines, :slug, unique: true
  end

end
