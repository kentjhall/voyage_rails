# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TeamMember.destroy_all
TeamMember.create(:name => "Daniel Zeballos", :role => "Designer", :img_path => "danny.png", :index => 1)
TeamMember.create(:name => "Cole Johnson", :role => "Designer", :img_path => "cole.png", :index => 2)
TeamMember.create(:name => "Kent Hall", :role => "Web Developer", :img_path => "kent.png", :index => 3)
