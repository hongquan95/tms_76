User.create!(name: "Tran Hong Quan",
             email: "hongquan95.tran@gmail.com",
             password: "12345678",
             password_confirmation: "12345678",
             role: 0)
User.create!(name: "Vo Van Long",
             email: "vovanlong1997@gmail.com",
             password: "12345678",
             password_confirmation: "12345678",
             role: 0)

5.times do |n|
  name  = Faker::Name.name
  email = "trainner-#{n+1}@gmail.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               role: 1)
end
50.times do |n|
  name  = Faker::Name.name
  email = "trainee-#{n+1}@gmail.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               role: 2)
end

20.times do |n|
  name  = Faker::Name.name
  description = Faker::Lorem.sentence(2)
  password = "password"
  Course.create!(name: name,
               description: description,
               start_date: 2.months.ago,
               end_date: 1.months.ago)
end

trainer1 = User.find(3)
trainer2 = User.find(4)
trainer3 = User.find(5)
courses  = Course.all
users = User.all
list_course1 = courses[1..5]
list_course2 = courses[3..9]
list_course3 = courses[5..15]
trainer1.courses << list_course1
trainer2.courses << list_course2
trainer3.courses << list_course3

course1 = Course.find(1)
course2 = Course.find(2)
course3 = Course.find(3)
list_user1 = users[3..20]
list_user2 = users[5..10]
list_user3 = users[4..15]
course1.users << list_user1
course2.users << list_user2
course3.users << list_user3
