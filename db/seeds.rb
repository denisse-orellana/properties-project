# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
20.times do |user|
  name = Faker::Name.unique.first_name   
  email = name + "@example.com"
  lastname = Faker::Name.unique.last_name  
  password = 'password'
  password_confirmation = 'password'

  @user = User.create!(
    name: name,
    lastname: lastname,
    email: email,
    password: password, 
    password_confirmation: password_confirmation
  )
end 
p "20 users created"

# Properties
20.times do |property|
  direction = Faker::Address.full_address
  price = rand(120..5000)
  area = rand(60..50000)
  room_number = rand(1..30)
  bathroom_number = rand(1..7)
  user = rand(User.first.id..User.last.id)

  @property = Property.new(
    direction: direction,
    area: area,
    price: price,
    room_number: room_number,
    bathroom_number: bathroom_number, 
    user_id: user,
  )

  @property.images.attach(
    io: File.open(Rails.root.join('db/seeds/foto-inmobiliario.png')),
    filename: 'foto-inmobiliario.png',
    content_type: 'image/png'
  )

  @property.save!
end 
p "20 properties created"