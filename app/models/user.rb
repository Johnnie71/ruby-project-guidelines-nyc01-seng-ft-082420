class User < ActiveRecord::Base
    has_many :useritems 
    has_many :items, through: :useritems

    def generate_stats
        User.skill = rand(1..5)
        User.health = rand(1..5)
        User.cleanliness = rand(1..5)
        User.spirituality = rand(1..5)
    end


    def gain_skill
        User.skill += [2,3,4].sample 
        # self.skill.rand(1..3)  
    end 

    def gain_energy
        self.energy += rand(1..3)
    end

    def lower_energy
        self.energy -= rand(1..3)
    end
    
    def gain_cleanliness
        self.cleanliness += rand(1..3)
    end 

    def gain_spiritualty
        self.spirituality += rand(1..3)
    end

    def lower_spirituality
        self.spirituality -= rand(1..3)
    end
# binding.pry
end

