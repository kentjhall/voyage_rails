class TeamMember < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :role
  validates_presence_of :index

end
