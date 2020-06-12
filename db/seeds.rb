# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def time_rand from = 0.0, to = Time.now
    Time.at(from + rand * (to.to_f - from.to_f))
end

puts "Cleaning Database"
Client.destroy_all
User.destroy_all

user = User.new(email: 'teste@gmail.com', password: '123456')
user.save

client = Client.new(user: user, name: 'Le Wagon', bio: 'A super cool Bootcamp')
client.save

project = Project.new(client: client, name: 'Lectures', description: "Just doing some lectures")
project.save

5.times do
  Payment.create(
      project: project,
      value: rand(1..10000),
      notes: 'Everything went well',
      paid: [true, false].sample,
      date_of_payment: time_rand
    )
end

# defining random date

