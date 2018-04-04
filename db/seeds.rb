# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.create(code: 'SFO')
Airport.create(code: 'NYC')
Airport.create(code: 'JHB')
letters = ('a'..'z').to_a
30.times do
  Airport.create(code: 'A' + letters[rand(26)] + letters[rand(26)])
end

Flight.create(origin: Airport.find(1), destination: Airport.find(2),
              depart_time: Time.now, arrive_time: Time.now + 2.hours)

30.times do
  time = Time.now+rand(60).days
  Flight.create(origin: Airport.find(1), destination: Airport.find(rand(31)+2),
                depart_time: time, arrive_time: time + 2.hours)
end

100.times do
  time = Time.now+rand(60).days
  Flight.create(origin: Airport.find(rand(32)+1), destination: Airport.find(rand(32)+1),
                depart_time: time, arrive_time: time + rand(6).hours)
end
