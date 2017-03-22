he# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  user = User.create!(
  name: Faker::LordOfTheRings.character,
  username_email: Faker::Internet.unique.email,
  password: "password",
  avatar_url: ""
  )
  4.times do
    Message.create(
    body: Faker::ChuckNorris.fact,
    user: user
    )
  end
end
