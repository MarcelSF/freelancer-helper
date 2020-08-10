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

thais = User.new(email: 'tsbpaiva@gmail.com', password: 'loviners', user_name: 'redhead')
thais.save

keywords = Client.new(user: thais name: 'Key Words', bio: 'Awesome translation company')
keywords.save

locsmiths = Client.new(user: thais name: 'Locsmiths', bio: 'European Translation Company')
locsmiths.save


destiny = Project.new(client: client, name: 'Lectures', description: "Just doing some lectures")
destiny.save

wow = Project.new(client: client, name: 'Lectures', description: "Just doing some lectures")
wow.save

tlou = Project.new(client: client, name: 'Lectures', description: "Just doing some lectures")
tlou.save


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

