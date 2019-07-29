class Ingredient
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all 
    end

    def self.most_common_allergen
        # Ingredient.most_common_allergen should return the ingredient instance that the highest number of users are allergic to
        allergens = Allergy.all.collect do |allergy|
            allergy.ingredient
        end
        allergens.max_by{|x| allergens.count(x)}
    end
end

