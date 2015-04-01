# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
2.times do
  fakeuser = User.create(email: Faker::Internet.email,
                         password: '123456789',
                         password_confirmation: '123456789')
  10.times do
    Restaurant.create(user_id:      fakeuser.id,
                      name:         Faker::Company.name,
                      description:  Faker::Lorem.sentence,
                      address:      Faker::Address.street_address,
                      phone:        Faker::Number.number(10),
                      )
  end
end
