require_relative '../config/environment.rb'

u1 = User.new("Greg")
u2 = User.new("Melissa")

ingredient_one = Ingredient.new("Strawberries")
ingredient_two = Ingredient.new("Almonds")


allergy1 = Allergy.new(u1, ingredient_one)
allergy2 = Allergy.new(u1, ingredient_two)

recipe1 = Recipe.new("Strawberry Shortcake")
recipe2 = Recipe.new("Chocolate cake")
recipe3 = Recipe.new("Almond butter")

card1 = RecipeCard.new(recipe1, u2, "Today", 5)
card2 = RecipeCard.new(recipe2, u1, "Yesterday", 4)

recipe_ingredient_1 = RecipeIngredient.new(ingredient_one, recipe1)
recipe_ingredient_2 = RecipeIngredient.new(ingredient_two, recipe3)





binding.pry

puts "hi"
