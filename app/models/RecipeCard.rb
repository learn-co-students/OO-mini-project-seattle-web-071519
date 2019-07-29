class RecipeCard
    attr_accessor :recipe, :user, :date, :rating
    @@all = []

    def initialize(recipe, user, rating, date=Time.now)
        @recipe = recipe
        @user = user
        @rating = rating
        @date = Time.now
        @@all << self
    end

    def self.all
        @@all
    end

    
end




# RecipeCard.all should return all of the RecipeCard instances
# RecipeCard#date should return the date of the entry
# RecipeCard#rating should return the rating (an integer) a user has given their entry
# RecipeCard#user should return the user to which the entry belongs
# RecipeCard#recipe should return the recipe to which the entry belongs
