class TeamMember < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :role
  validates_presence_of :city
  validates_presence_of :dob
  validates_presence_of :hobbies
  validates_presence_of :fav_movie
  validates_presence_of :fav_album
  validates_presence_of :index

end
