# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Hairstyle.destroy_all
User.destroy_all

puts 'Creating users...'

users = [
{
 first_name: 'test',
 last_name: 'Inniss',
 email: 'antonia@hair.com',
 password: '123456'
},

{
  first_name: 'test2',
  last_name: 'Clarke',
  email: 'anthony@hair.com',
  password: '123456'
},
{
  first_name: 'test3',
  last_name: 'Clarke',
  email: 'claire@hair.com',
  password: '123456'
},
{
  first_name: 'test4',
  last_name: 'Clarke',
  email: 'james@hair.com',
  password: '123456'
},
{
  first_name: 'test5',
  last_name: 'Clarke',
  email: 'maddie@hair.com',
  password: '123456'
},
{
  first_name: 'test6',
  last_name: 'Clarke',
  email: 'hope@hair.com',
  password: '123456'
},
{
  first_name: 'test7',
  last_name: 'Clarke',
  email: 'blue@hair.com',
  password: '123456',
}
]

User.create!(users)

puts 'Finished!'

puts 'Creating hairstyles...'

hairstyles = [
  {
    name: 'Single Braids',
    description: 'Really easy to maintain',
    category: 'Braids',
    video_url: 'www.google.com',
    photo_url: 'https://images.unsplash.com/photo-1533233336213-b3a32825c689?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1049&q=80',
    user: User.first
  },
  {
    name: 'Crochets',
    description: 'Protective style',
    category: 'Braids',
    video_url: 'www.google.com',
    photo_url: 'https://images.unsplash.com/photo-1533233336213-b3a32825c689?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1049&q=80',
    user: User.first
  },
    {
    name: 'Updo',
    description: 'Protective style',
    category: 'Relaxed',
    video_url: 'www.google.com',
    photo_url: 'https://images.unsplash.com/photo-1533233336213-b3a32825c689?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1049&q=80',
    user: User.first
  },
    {
    name: 'Curlz',
    description: 'Protective style',
    category: 'Relaxed',
    video_url: 'www.google.com',
    photo_url: 'https://images.unsplash.com/photo-1533233336213-b3a32825c689?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1049&q=80',
    user: User.first
  },
    {
    name: 'Pink and Drop',
    description: 'Protective style',
    category: 'Braids',
    video_url: 'www.google.com',
    photo_url: 'https://images.unsplash.com/photo-1533233336213-b3a32825c689?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1049&q=80',
    user: User.first
  },
    {
    name: 'Braided Bob',
    description: 'Protective style',
    category: 'Braids',
    video_url: 'www.google.com',
    photo_url: 'https://images.unsplash.com/photo-1533233336213-b3a32825c689?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1049&q=80',
    user: User.first
  },
    {
    name: 'Spring Twist',
    description: 'Protective style',
    category: 'Braids',
    video_url: 'www.google.com',
    photo_url: 'https://images.unsplash.com/photo-1533233336213-b3a32825c689?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1049&q=80',
    user: User.first
  },
    {
    name: 'Senegalese Twist',
    description: 'Protective style',
    category: 'Braids',
    video_url: 'www.google.com',
    photo_url: 'https://images.unsplash.com/photo-1533233336213-b3a32825c689?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1049&q=80',
    user: User.first
  },
    {
    name: 'Perm',
    description: 'Protective style',
    category: 'Relaxed',
    video_url: 'www.google.com',
    photo_url: 'https://images.unsplash.com/photo-1533233336213-b3a32825c689?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1049&q=80',
    user: User.first
  }
]
puts 'Finished!'

hairstyles.each do |h| hairstyle = Hairstyle.new(h); unless hairstyle.save then puts hairstyle.errors.inspect
  end
end
