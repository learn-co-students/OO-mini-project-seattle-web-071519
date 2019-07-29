require_relative '../config/environment.rb'

peanuts = Ingredient.new("Peanuts")
milk = Ingredient.new("Milk")
strawberries = Ingredient.new("Strawberries")
sugar = Ingredient.new("Sugar")

snickers = Recipe.new("Snickers")
pie = Recipe.new("Pie")
cake = Recipe.new("Cake")
soup = Recipe.new("Soup")

helen = User.new("Helen")
rosie = User.new("Rosie")
kas = User.new("Kas")

peanut_allergy = Allergy.new(helen, peanuts)
strawberry_allergy = Allergy.new(rosie, strawberries)
kas_allergy = Allergy.new(kas, peanuts)

snicker_card = RecipeCard.new(peanuts, helen, 9)

helen.add_recipe_card(pie, 10)
helen.add_recipe_card(cake, 5)
helen.add_recipe_card(soup, 2)
kas.add_recipe_card(soup, 5)

snickers.add_ingredients([peanuts, sugar])
cake.add_ingredients([sugar])

binding.pry
