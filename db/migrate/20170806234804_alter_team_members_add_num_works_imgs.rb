class AlterTeamMembersAddNumWorksImgs < ActiveRecord::Migration[5.1]

  def up
    add_column :team_members, "num_works_imgs", :integer
  end

  def down
    remove_column :team_members, "num_works_imgs"
  end

end
