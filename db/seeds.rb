# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Creating 10 fake hairstyles...'
10.times do
  hairstyle = Hairstyle.new(
    name: Faker::Name.unique.first_name,
    description: Faker::Lorem.sentence,
  )
  hairstyle.save!
end

puts 'finished!'
