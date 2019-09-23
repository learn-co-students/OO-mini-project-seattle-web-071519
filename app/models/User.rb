class User
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    #helper method to get recipe cards
    def cards
        RecipeCard.all.select do |recipe_card|
            recipe_card.user == self
        end
    end

    def recipes
        # return all of the recipes this user has recipe cards for
        cards.map do |recipe_card|
            recipe_card.recipe
        end
    end

    def add_recipe_card(recipe, date, rating)
        new_card = RecipeCard.new(recipe, self, date, rating)
    end

    def declare_allergy(ingredient)
        new_allergy = Allergy.new(self, ingredient)
    end

    def allergens
        Allergy.all.select do |allergy| 
            allergy.user == self
        end.collect do |allergy|
            allergy.ingredient
        end
    end

    def top_three_recipes
        sorted = cards.sort do |a, b|
            #spaceship operator to sort from highest rating to lowest
            b.rating <=> a.rating
        end
        sorted.slice[0..2].collect do |card|
            card.recipe
        end
    end

    def most_recent_recipe
        cards.last.recipe
    end

    #bonus
    def safe_recipes
        #go through user's recipes and get rid of any recipes 
        #that contain any allergens - user helper method
        recipes.select do |recipe|
            self.is_safe?(recipe)
        end
    end

    #helper method to find out if a given recipe instance is safe to eat
    def is_safe?(recipe)
        !recipe.ingredients.any? do |ingredient|
            allergens.include?(ingredient)
        end
    end
end