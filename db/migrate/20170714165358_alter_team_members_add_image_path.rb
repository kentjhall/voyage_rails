class AlterTeamMembersAddImagePath < ActiveRecord::Migration[5.1]

  def up
    add_column :team_members, "img_path", :string
  end

  def down
    remove_column :team_members, "img_path"
  end

end
