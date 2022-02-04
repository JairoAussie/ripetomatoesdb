# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Review.destroy_all
Perform.destroy_all
Movie.destroy_all
Actor.destroy_all
puts 'Cleaning database...'
puts 'Database ready for seeding...'
puts 'Seeding database'
m1 = Movie.create(title: 'Top Gun', genre:'Action', year: 1986, length: 110)
m2 = Movie.create(title: 'Spider-Man: No Way Home', genre:'Action', year: 2021, length: 148)
m3 = Movie.create(title: "Don't Look Up", genre: "Comedy/Disaster", year: 2021, length: 145)
m4 = Movie.create(title: 'Dune', genre: 'Sci-fi', year: 2021, length: 155)
m5 = Movie.create(title: 'The Power of the Dog', genre: 'Western', year: 2021, length: 125)

#m2
#m3
#m4
a1 = Actor.create(name: 'Tom Cruise', dob: 1962)
a2 = Actor.create(name: 'Val Kilmer', dob: 1959)
a3 = Actor.create(name: 'Tom Holland', dob: 1995)
a4 = Actor.create(name: 'Zendaya', dob: 1996)
a5 = Actor.create(name: 'Benedict Cumberbatch', dob: 1976)
a6 = Actor.create(name: 'Jeniffer Lawrence', dob: 1990)
a7 = Actor.create(name: 'Leo Di Caprio', dob: 1974)
a8 = Actor.create(name: 'Meryl Streep', dob: 1949)
a9 = Actor.create(name: 'Cate Blanchett', dob: 1969)
a10 = Actor.create(name: 'Timothée Chalamet', dob: 1995)
a11 = Actor.create(name: 'Kirsten Dunst', dob: 1995)

#a2
#a3
#a4
#r1 = Review.create(message: 'Absolutely stunning!', stars: 5, movie: m1)
#r2
#r3
p1 = Perform.create(movie: m1, actor: a1, role: 'Maverick')
p2 = Perform.create(movie: m1, actor: a2, role: 'Iceman')
p3 = Perform.create(movie: m2, actor: a3, role: 'Peter Parker')
p4 = Perform.create(movie: m2, actor: a4, role: 'MJ')
p5 = Perform.create(movie: m2, actor: a5, role: 'Doctor Strange')
p6 = Perform.create(movie: m3, actor: a6, role: 'Kate Dibiasky')
p7 = Perform.create(movie: m3, actor: a7, role: 'Randall Mindy')
p8 = Perform.create(movie: m3, actor: a8, role: 'President Janie Orlean')
p9 = Perform.create(movie: m3, actor: a9, role: 'Brie Evantee')
p10 = Perform.create(movie: m3, actor: a10, role: 'Yule')
p11 = Perform.create(movie: m4, actor: a4, role: 'Chani')
p12 = Perform.create(movie: m4, actor: a10, role: 'Paul Atreides')
p11 = Perform.create(movie: m5, actor: a11, role: 'Rose Gordon')
p12 = Perform.create(movie: m5, actor: a5, role: 'Phil Burbank')
puts 'Database is ready'