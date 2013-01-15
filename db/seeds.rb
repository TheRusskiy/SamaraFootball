# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
games = [{:place => 'Torpedo', :price => '1000'},
    	  {:place => 'CSKA', :price => '2000'},
    	  {:place => 'Dvorec', :price => '3000'},
      	  {:place => 'Dvor', :price => '0'},
  	 ]

games.each do |game|
  Game.create!(game)
end
