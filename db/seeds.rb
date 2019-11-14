# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts 'Clearing database...'
Ingredient.destroy_all

puts 'Seeding ingredients...'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

JSON.parse(URI.open(url).read)['drinks'].each do |ingredients|
  Ingredient.create(name: ingredients['strIngredient1'])
end

puts 'Finished seeding!'
