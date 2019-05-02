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
