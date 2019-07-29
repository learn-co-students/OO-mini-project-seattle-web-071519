class Allergy
    attr_reader :user, :ingredient
    @@all =[]

    def initialize(user, ingredient)
        @user = user
        @ingredient = ingredient

        @@all << self
    end

    def Allergy.all
        @@all
    end
end