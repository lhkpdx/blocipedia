require 'random_data'

5.times do
   User.create!(
     username: RandomData.random_name,
     email: RandomData.random_email,
     password: RandomData.random_sentence,
     role: RandomData.random_role
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

 # 10.times do
 #   Reference.create!(
 #   name:  RandomData.random_sentence,
 #   date:  Time.now.to_datetime,
 #   link: "http://google.com"
 #   )
 # end
 # references = Reference.all

 50.times do
   wiki = Wiki.create!(
     user:   users.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     private:  RandomData.random_private,
    #  reference_id:  references.first.id
   )
    wiki.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
 end
 wikis = Wiki.all

  puts "Seed finished"
  puts "#{User.count} users created"
  puts "#{Wiki.count} wikis created"
