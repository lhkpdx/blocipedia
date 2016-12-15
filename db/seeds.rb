require 'random_data'

5.times do
   User.create!(
     username: Faker::Hacker.noun,
     email: Faker::Internet.email,
     password: Faker::Internet.password(6),
     role: "standard"
     )
 end
 users = User.all


 admin = User.new(
  username: "Admin User",
  email: "admin@me.com",
  password: "ffffff",
  password_confirmation: "ffffff",
  role: 'admin'
 )
 admin.skip_confirmation!
 admin.save!

 premium = User.new(
  username: "Premium User",
  email: "premium@me.com",
  password: "ffffff",
  role: 'premium',
  password_confirmation: "ffffff"
 )
 premium.skip_confirmation!
 premium.save!

 standard = User.new(
  username: "Standard User",
  email: "standard@me.com",
  password: "ffffff",
  password_confirmation: "ffffff",
  role: 'standard'
 )
 standard.skip_confirmation!
 standard.save!

 20.times do
   News.create!(
   subject: Faker::Space.agency,
   article: Faker::Hacker.say_something_smart,
   user: users.sample
   )
 end

 50.times do
   wiki = Wiki.create!(
     user:   users.sample,
     title:  Faker::Beer.name,
     body:   Faker::Beer.style + " " + Faker::Beer.ibu + " " + Faker::ChuckNorris.fact,
     private:  Faker::Boolean.boolean,
     created_at: Faker::Date.backward(30)

   )
    wiki.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
 end
 wikis = Wiki.all

 200.times do
   Reference.create!(
   name:  Faker::Space.galaxy,
   date:  Faker::Date.backward(7),
   link:  Faker::Internet.url,
   wiki: wikis.sample
   )
 end
 references = Reference.all

 200.times do
   WikiEvent.create!(
   action:  "update",
   created_at:  Faker::Date.backward(7),
   wiki: wikis.sample,
   user: users.sample
   )
 end
  wiki_events = WikiEvent.all

  puts "Seed finished"
  puts "#{User.count} users created"
  puts "#{Wiki.count} wikis created"
  puts "#{Reference.count} references created"
  puts "#{News.count} news articles created"
