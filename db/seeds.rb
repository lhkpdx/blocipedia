require 'random_data'

5.times do
   User.create!(
     username:     RandomData.random_name,
     email:    RandomData.random_email,
     password: RandomData.random_sentence
     )
 end
 users = User.all
 User.create!(
  username: "Laura",
  email: "me@me.com",
  password: "ffffff"
 )

 50.times do
   wiki = Wiki.create!(
     user:   users.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     private:  RandomData.random_private
   )
    wiki.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)



 end
 wikis = Wiki.all

  puts "Seed finished"
  puts "#{User.count} users created"
  puts "#{Wiki.count} wikis created"
