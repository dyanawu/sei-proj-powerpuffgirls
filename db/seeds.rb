# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Fixed species table
Species.create(name: 'Dog')
Species.create(name: 'Cat')

25.times{print"-"}
puts

# Fake Users [username: firstname, email: firstname@email.com, password: 123456]
20.times do
      name = Faker::Name.first_name.downcase
      User.create! :username => "#{name}", :email => "#{name}@email.com", :password => "123456", :password_confirmation => "123456"

      puts "Created user called #{name} with email #{name}@email.com"
end

25.times{print"-"}
puts

# Fake user profiles for each user
User.all.each do |user|
      puts "Created profile for #{user.username}"
      Profile.create(user_id: user.id, dp_url: Faker::LoremFlickr.image, bio: Faker::Lorem.paragraph, location: Faker::Address.street_address, gender: Faker::Gender.short_binary_type, birthday:"#{rand(1950..2000)}-#{rand(1..12)}-#{rand(1-28)}")
end

25.times{print"-"}
puts


# Fake Pets for random users
30.times do
      
      pet = Pet.create(name: Faker::Name.first_name, dp_url: Faker::LoremFlickr.image, species_id: rand(1..2), birthday: "#{rand(1990..2019)}-#{rand(1..12)}-#{rand(1-28)}", bio: Faker::Lorem.paragraph, user_id: rand(User.first.id..User.last.id))

      puts "Created #{pet.name} the #{pet.species.name} belonging to #{pet.user.username} (user id: #{pet.user.id})"
end

25.times{print"-"}
puts


# Generate fake events under random users 
20.times do
      user = User.find(rand(User.first.id..User.last.id))

      # Starts on a random date/time 28 days before or after today
      start_time = DateTime.now + (rand(-1..1) * 28) + rand(-24..24).hours

      #End time is 1 to 4 hours after start time.
      #Event is named after user. E.g. "chelsea's event"

      event = Event.create(user_id: user.id, title: "#{user.username}'s event", description: Faker::Lorem.paragraph, capacity: rand(2..20), location: Faker::Address.street_address, start_time: start_time, end_time: start_time + rand(1..4).hours, min_pets: 0)

      puts "Created #{event.title}"
end

25.times{print"-"}
puts


# Link random pets to random events.
50.times do
      event = Event.find(rand(Event.first.id..Event.last.id))
      pet = Pet.find(rand(Pet.first.id..Pet.last.id))
      event.pets << pet
      puts "Added #{pet.name} to #{event.title}"
end