class CreateTeamMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :team_members do |t|
      t.string "name"
      t.string "role"

      t.timestamps
    end
  end
end
