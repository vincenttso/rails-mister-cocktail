# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts 'Clearing doses...'
Dose.destroy_all

puts 'Clearing ingredients...'
Ingredient.destroy_all

puts 'Clearing cocktails...'
Cocktail.destroy_all

puts 'Seeding ingredients...'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

JSON.parse(URI.open(url).read)['drinks'].each do |ingredients|
  Ingredient.create(name: ingredients['strIngredient1'])
end

puts 'Done!'

puts 'Seeding cocktails...'

cocktails = [
  {
    name: 'Mojito',
    description: 'The best mojito you\'ll ever find. What a delight!',
    photo: File.open(File.join(Rails.root, 'app/assets/images/mojito.jpeg'))
  },
  {
    name: 'Cuba Libre',
    description: 'Want an exotic experience? This Cuba Libre will do just the trick!',
    photo: File.open(File.join(Rails.root, 'app/assets/images/cuba_libre.jpeg'))
  },
  {
    name: 'Sex On The Beach',
    description: 'Spice and excitement is just what the sex on the beach delivers!',
    photo: File.open(File.join(Rails.root, 'app/assets/images/sex_on_the_beach.jpeg'))
  },
  {
    name: 'Rhubarb Gin',
    description: 'Only the best for cocktail experts.',
    photo: File.open(File.join(Rails.root, 'app/assets/images/rhubarb_gin.jpeg'))
  },
  {
    name: 'Pina Colada',
    description: 'Nothing more delightful than a well made pina colada!',
    photo: File.open(File.join(Rails.root, 'app/assets/images/pina_colada.jpeg'))
  },
  {
    name: 'Martini',
    description: 'Class and taste.',
    photo: File.open(File.join(Rails.root, 'app/assets/images/martini.jpeg'))
  },
  {
    name: 'Bloody Mary',
    description: 'Exciting! Red, red and.. Red!',
    photo: File.open(File.join(Rails.root, 'app/assets/images/bloody_mary.jpeg'))
  },
  {
    name: 'Margarita',
    description: 'The best things in life are tangy!',
    photo: File.open(File.join(Rails.root, 'app/assets/images/margarita.jpeg'))
  }
]

units = %w[drop/s pinch/es ml/s cup/s tsp/s tbsp/s]

cocktails.each do |cocktail|
  new_cocktail = Cocktail.create(cocktail)
  rand(1..5).times do
    amount = rand(1..10)
    if amount < 5
      amount
    else
      amount = rand(1..65) * 5
    end
    Dose.create!(cocktail_id: new_cocktail.id, measurement: amount, unit: units.sample, ingredient_id: Ingredient.all.sample.id)
  end
end

puts 'Finished seeding!'
