class AlterTeamMembersAddInfo < ActiveRecord::Migration[5.1]

  def up
    add_column :team_members, "city", :string
    add_column :team_members, "dob", :string
    add_column :team_members, "hobbies", :string
    add_column :team_members, "fav_movie", :string
    add_column :team_members, "fav_album", :string
  end

  def down
    remove_column :team_members, "fav_album"
    remove_column :team_members, "fav_movie"
    remove_column :team_members, "hobbies"
    remove_column :team_members, "dob"
    remove_column :team_members, "city"
  end

end
