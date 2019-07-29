class Recipe
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end
    
    def Recipe.most_popular
        Recipe.all.max_by{|recipecards| recipecards.count}
    end

    def recipe_cards
        RecipeCard.all.select{ |rc| rc.recipe == self}
    end

    def users
        # should return the user instances who have recipe cards with this 
        self.recipe_cards.collect{ |rc| rc.user}
    end

    def ingredients
        # should return all of the ingredients in this recipe
        RecipeIngredient.all.select{ |ri| ri.recipe == self}.collect{ |ri| ri.ingredient}
    end

    def Recipe.most_popular
        # should return the recipe instance with the highest number of users (the recipe that has the most recipe cards)
        Recipe.all.max_by{|recipe| recipe.recipe_cards.count}
    end

    def allergens
        # should return all of the Ingredients in this recipe that are allergens for Users in our system.
        allergies = Allergy.all.select{ |allergy| self.ingredients.include?(allergy.ingredient)}
        allergies.collect{ |allergy| allergy.ingredient}.uniq
    end

    def add_ingredients(array)
        # should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe
        array.each do |ingredient|
            RecipeIngredient.new(self, ingredient)
        end
    end

end

