class User
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name

        @@all << self
    end

    def self.all
        @@all
    end

    def recipe_cards
        RecipeCard.all.select do |card|
            card.user == self
        end
    end

    def recipes
        # return all of the recipes this user has recipe cards for
        self.recipe_cards.collect do |card|
            card.recipe
        end
    end

    def add_recipe_card(recipe, rating, date=Time.now)
        # should accept a recipe instance as an argument, as well as a date and rating, and create a new recipe card for this user and the given recipe
        RecipeCard.new(recipe, self, rating, date)
    end

    def declare_allergy(ingredient)
        # create a new Allergy instance for this User and the given Ingredient
        Allergy.new(self, ingredient)
    end

    def allergens
        # should return all of the ingredients this user is allergic to
        allergies = Allergy.all.select do |allergy|
            allergy.user == self
        end
        allergies.collect do |allergy|
            allergy.ingredient
        end
    end

    def top_three_recipes
        # should return the top three highest rated recipes for this user.
        self.recipe_cards.sort_by{ |x| x.rating}.reverse.first(3).collect{|card| card.recipe}

    end
    
    def most_recent_recipe
        # should return the recipe most recently added to the user's cookbook
        self.recipe_cards.max_by{ |x| x.date}.recipe
    end

    def safe_recipes
        #safe_recipes should return all recipes that do not contain ingredients the user is allergic to
        Recipe.all.reject do |recipe|
            recipe.ingredients.any?{ |ingredient|
                 self.allergens.include?(ingredient)}
        end
    end
end



