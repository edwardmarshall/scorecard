User.destroy_all
Animal.destroy_all
Antler.destroy_all
Point.destroy_all


u1 = { :username => "tophamt",	:email => "travis.topham@gmail.com", :first_name => "Travis", :last_name => "Topham", :password => "test", :password_confirmation => "test" },
User.create u1

["db/fixtures/muledeer1.yml",
	"db/fixtures/muledeer2.yml",
	"db/fixtures/muledeer3.yml",
	"db/fixtures/muledeer4.yml",
	"db/fixtures/muledeer_shedset1.yml",
	"db/fixtures/elk1.yml",
	"db/fixtures/elk2.yml",
		].each do |filename|
	animal_data = YAML::load( File.open(filename))
	a = Animal.create(animal_data[:animal]) # create THIS animal in an instance variable 'a'
	a.antlers.create(animal_data[:antlers]) # take 'a' and create THESE antlers for THIS animal
	a.right_antler.points.create(animal_data[:right_points]) # take right_antler (defined in animal model) of 'a' and give it THESE points
	a.left_antler.points.create(animal_data[:left_points])
end

# # belongs_to relationships
# animal_data.each do |animal| #grabs all animals from SEED and loop for each
# 	a = Animal.create(animal) # create THIS animal in an instance variable 'a'
# 	a.antlers.create(antlers) # take 'a' and create THESE antlers for THIS animal
# 	a.right_antler.points.create(right_points) # take right_antler (defined in animal model) of 'a' and give it THESE points
# 	a.left_antler.points.create(left_points)
# end

puts "#{User.count} user(s) in the database."
puts "#{Animal.count} animal(s) in the database."
puts "#{Antler.count} antler(s) in the database."
puts "#{Point.count} point(s) in the database."



















