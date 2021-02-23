# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create adname: "Nigga", 
admail: "admin@gmail.com",
password: "123456"

5.times do |i|
    User.create name: Faker::Name.name,
    email: "nigga#{i+1}@gmail.com",
    password: "123456",
    coin: "100",
    DLerr: "0"
end

5.times do |i|
    Category.create categoryname: Faker::Lorem.sentence(word_count: 1)
end

# 20.times do 
#     Comment.create content: Faker::Lorem.sentence(word_count: 10),
#    user_id: 1,
#    e_doc_id: 1
# end

