# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts '*** Creating Users ***'
vanilla_user = User.create!(email: 'vanilla_user1@gmail.com', password: 'password', password_confirmation: 'password')
editor_user = User.create!(email: 'editor_user@gmail.com', password: 'password', password_confirmation: 'password', roles: :editor)
editor_user2 = User.create!(email: 'editor_user2@gmail.com', password: 'password', password_confirmation: 'password', roles: :editor)
admin_user = User.create!(email: 'admin_user@gmail.com', password: 'password', password_confirmation: 'password', roles: :admin)

puts '*** Creating Articles ***'
Article.create!(title: 'GO PACK GO', category: 'Sports', content: 'Heading to the NFC championship', user_id: editor_user.id)
Article.create!(title: 'WHO DAT', category: 'Sports', content: 'Drew Brees to retire??!', user_id: editor_user.id)
Article.create!(title: 'Chiefs Kingdom', category: 'Sports', content: 'Patrick Mahomes II out with an concussion', user_id: editor_user2.id)
Article.create!(title: 'Pizza Toppings', category: 'Food', content: 'pepperoni, sausage, and beef', user_id: editor_user.id)
Article.create!(title: 'Taco Tuesday', category: 'Food', content: 'All you can eat tacos. What more can you want?', user_id: editor_user2.id)
Article.create!(title: 'Hamburgurlar', category: 'Food', content: 'Whoelse would you blame for stealing all of Mcdonalds burgers?', user_id: editor_user.id)
Article.create!(title: '90s Hip Hop Artist', category: 'Music', content: 'Mic check one two who is this...', user_id: editor_user.id)




