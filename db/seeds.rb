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

puts 'Seeding cocktails...'

cocktails = [
  {
    name: 'Mojito',
    description: 'The best mojito you\'ll ever find. What a delight!',
    photo: '../../app/assets/images/mojito.jpeg'
  },
  {
    name: 'Cuba Libre',
    description: 'Want an exotic experience? This Cuba Libre will do just the trick!',
    photo: 'cuba_libre.jpeg'
  },
  {
    name: 'Sex On The Beach',
    description: 'Spice and excitement is just what the sex on the beach delivers!',
    photo: 'sex_on_the_beach'
  },
  {
    name: 'Rhubarb Gin',
    description: 'Only the best for cocktail experts.',
    photo: 'rhubarb_gin.jpeg'
  },
  {
    name: 'Pina Colada',
    description: 'Nothing more delightful than a well made pina colada!',
    photo: 'pina_colada.jpeg'
  },
  {
    name: 'Martini',
    description: 'Class and taste.',
    photo: 'martini.jpeg'
  },
  {
    name: 'Bloody Mary',
    description: 'Exciting! Red, red and.. Red!',
    photo: 'bloody_mary.jpeg'
  },
  {
    name: 'Margarita',
    description: 'The best things in life are tangy!',
    photo: 'margarita.jpeg'
  }
]

cocktails.each do |cocktail|
  upload = Cloudinary::Uploader.upload(cocktail[:photo], :crop => "limit")
  new_cocktail = Cocktail.new(cocktail)
  new_cocktail.photo = upload
end

puts 'Done! Seeding ingredients...'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

JSON.parse(URI.open(url).read)['drinks'].each do |ingredients|
  Ingredient.create(name: ingredients['strIngredient1'])
end

puts 'Finished seeding!'
