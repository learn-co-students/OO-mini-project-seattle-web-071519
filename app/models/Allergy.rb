class Allergy
    attr_accessor :user, :ingredient
    @@all = []

    #initialize with user and ingredient 
    #so that allergy can be the connector
    def initialize(user, ingredient)
        @user = user
        @ingredient = ingredient
        @@all << self
    end

    def self.all
        @@all
    end
end