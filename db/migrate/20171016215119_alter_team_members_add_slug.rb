class AlterTeamMembersAddSlug < ActiveRecord::Migration[5.1]

  def change
    add_column :team_members, :slug, :string
    add_index :team_members, :slug, unique: true
  end

end
