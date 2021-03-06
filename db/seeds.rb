# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def rand_time(from, to=Time.now)
  Time.at(rand(from.to_f..to.to_f))
end

10.times do
  user = User.create!(
  name: Faker::LordOfTheRings.character,
  username_email: Faker::Internet.unique.email,
  password: "password",
  avatar_url: Faker::Avatar.image("50x50")
  )
  4.times do
    Message.create(
    body: Faker::ChuckNorris.fact,
    user: user,
    created_at: rand_time(2.years.ago).to_formatted_s(:long_ordinal)
    )
  end
end
