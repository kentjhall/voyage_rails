# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Team Members

TeamMember.destroy_all

TeamMember.create(:name => "Daniel Zeballos",
                  :role => "Designer",
                  :city => "Washington, DC",
                  :dob => "Jan 1 2000",
                  :hobbies => "Painting, Drawing, Music",
                  :fav_movie => "No Country for Old Men",
                  :fav_album => "2 - Mac DeMarco",
                  :num_works_imgs => 5,
                  :img_path => "danny",
                  :index => 1)

TeamMember.create(:name => "Cole Johnson",
                  :role => "Designer",
                  :city => "Leesburg, VA",
                  :dob => "Jul 20 2000",
                  :hobbies => "Snowboarding, Design, Frisbee",
                  :fav_movie => "Baby Driver",
                  :fav_album => "Wolf - Tyler, The Creator",
                  :num_works_imgs => 0,
                  :img_path => "cole",
                  :index => 2)
TeamMember.create(:name => "Kent Hall",
                  :role => "Web Developer",
                  :city => "Long Valley, NJ",
                  :dob => "Jun 17 2000",
                  :hobbies => "Skating, Writing, Programming",
                  :fav_movie => "The Shawshank Redemption",
                  :fav_album => "Flower Boy – Tyler, The Creator",
                  :num_works_imgs => 0,
                  :img_path => "kent",
                  :index => 3)

# Shipping Methods

ShippingMethod.destroy_all

ShippingMethod.create( :name => "Flat-Rate Shipping", :cost => 6 )
ShippingMethod.create( :name => "Mercersburg Academy Delivery", :cost => 0 )
