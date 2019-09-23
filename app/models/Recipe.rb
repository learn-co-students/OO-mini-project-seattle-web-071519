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

    def self.most_popular
        #return the recipe instance with the highest number of users
        #(the recipe that has the most recipe cards)
        self.all.max_by do |recipe|
            recipe.users.length
        end
    end

    #helper method to get recipe cards
    def cards
        RecipeCard.all.select do |recipe_card|
            recipe_card.recipe == self
        end
    end


    def users
        #return the user instances who have recipe cards with this recipe
        self.cards.collect do |card|
            card.user
        end
    end

    def ingredients
        # return all of the ingredients in this recipe
        RecipeIngredient.all.select do |recipe_ingredient|
            recipe_ingredient.recipe == self
        end.collect do |recipe|
            recipe.ingredient
        end
    end

    def allergens
        #return all of the Ingredients in this recipe that are allergens 
        #for Users in our system
        self.ingredients.select do |ingredient|
            Allergy.all.map do |allergy|
                allergy.ingredient
            end.include?(ingredient)
        end
    end

    def add_ingredients(ingredient_list)
        #take an array of ingredient instances as an argument, 
        #and associate each of those ingredients with this recipe
        self.ingredients.each do |ingredient| 
            RecipeIngredient.new(ingredient, self)
        end
    end


end