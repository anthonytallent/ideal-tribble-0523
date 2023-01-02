# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

universal = Studio.create!(name: "Universal Studios", location: "LA")
limo = Studio.create!(name: "Limo Productions", location: "Glendale")

mummy = universal.movies.create!(title: "The Mummy", creation_year: "1999", genre: "Action")
legally_blonde = universal.movies.create!(title: "Legally Blonde", creation_year: "2000", genre: "comedy")
the_grinch = limo.movies.create!(title: "The Grinch", creation_year: "2001", genre: "Holiday")

jim = the_grinch.actors.create!(name: "Jim Carrey", age: "30")
reese = legally_blonde.actors.create!(name: "Reese Witherspoon", age: "32")
brendan = mummy.actors.create!(name: "Brendan Frazier", age: "33")
cindy = the_grinch.actors.create!(name: "Cindy Lou-Who", age: "8")
