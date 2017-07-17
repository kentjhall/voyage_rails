class AlterTeamMembersAddIndex < ActiveRecord::Migration[5.1]

  def up
    add_column :team_members, "index", :integer
  end

  def down
    remove_column :team_members, "index"
  end

end
