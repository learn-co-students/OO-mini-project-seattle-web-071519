class Ingredient
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def allergies
        Allergy.all.select do |allergy|
            allergy.ingredient == self
        end
    end

    def most_common_allergen
        self.all.max_by do |ingredient|
            ingredient.allergies.length
        end
    end
end