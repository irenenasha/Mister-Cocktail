require 'rest-client'

require 'json'

puts 'parsing ingredients'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
response = RestClient.get url
repos = JSON.parse(response)
ingredients = repos.values.flatten
p ingredients
p ingredients.length
p ingredients.class
ingredients.each do |i|
  ingred = i.values.join('')
  p ingred
  ingre = Ingredient.new(name: ingred.to_s)
  ingre.save
  # end
end
puts 'Ingredients all Saved !!!'
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
