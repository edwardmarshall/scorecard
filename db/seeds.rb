User.destroy_all
Animal.destroy_all
Antler.destroy_all
Point.destroy_all

users = [
	{ :username => "tophamt",	:email => "travis.topham@gmail.com", :first_name => "Travis", :last_name => "Topham", :password_digest => "test" },
	{ :username => "bstopham", :email => "bstopham@gmail.com", :first_name => "Seth", :last_name => "Topham", :password_digest => "test" },
	{ :username => "sky5top", :email => "skylar.topham@gmail.com", :first_name => "Skylar", :last_name => "Topham", :password_digest => "test" },
	{ :username => "toddcal", :email => "toddcalicao@example.com", :first_name => "Todd", :last_name => "Calico", :password_digest => "test" },
	{ :username => "buckhunter345", :email => "utdeer4life@example.com", :first_name => "Smith", :last_name => "Ryder", :password_digest => "test" },
]

animals = [
	{ :certification => "true", :image => "image.jpg", :kind => "mule deer", :state => "ut", :unit => "13b", :alias => "the buck of justice", :spread_tip => 162, :spread_greatest => 260, :spread_inside => 195 },
]

antlers = [
	{ :side => "right", :certification => "true", :lg_mainbeam => 220, :lg_one => 26, :lg_two => 147, :lg_three => 110, :lg_four => 131, :circ_one => 42, :circ_two => 37, :circ_three => 32, :circ_four => 31 },
	{ :side => "left", :certification => "true", :lg_mainbeam => 220, :lg_one => 22, :lg_two => 158, :lg_three => 107, :lg_four => 123, :circ_one => 42, :circ_two => 37, :circ_three => 32, :circ_four => 36 },
]

points = [
	{ :lg_point => 37 },
	{ :lg_point => 36 },
	{ :lg_point => 35 },
	{ :lg_point => 40 },
]

User.create users
Animal.create animals
Antler.create antlers
Point.create points

# belongs_to relationships
animals.each do |animal|
	Animal.create(animal)
		

# many_to_many relationships
# roles.each do |role|
# 	u = User.find_by_id(role[:user])
# end


puts "#{User.count} user(s) in the database."
puts "#{Animal.count} animal(s) in the database."
puts "#{Antler.count} antler(s) in the database."
puts "#{Point.count} point(s) in the database."



















