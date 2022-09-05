# Create user admin
User.create!(name: "Example User",
             email: "example@railstutorial.org",
             password: "foobar",
             password_confirmation: "foobar",
             role: 1,
             activated: true,
             activated_at: Time.zone.now)
99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               role: 0,
               activated: true,
               activated_at: Time.zone.now)
end
for n in 1..30
  SoccerField.create!(name: Faker::Name.name,
              address: Faker::Name.name + " - " + Faker::Name.name,
              field_type: 1,
              rate: 1,
              hour_price: 1,
              )
end
