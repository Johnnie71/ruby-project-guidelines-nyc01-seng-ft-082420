class User < ActiveRecord::Base
    has_many :useritems
    has_many :item, through: :useritems

    attr_writer :skill

    # gain skill
    def gain_skill_method(num)
        skill = 10
        self.skill += num
    end

    # gain energy
    def gain_energy_method(num)
        self.energy += num
    end

    # energy down
    def energy_down_method(num)
        self.energy -= num
    end

    # gain cleanliness
    def gain_cleanliness_method(num)
        self.cleanliness += num
    end 



    # gain spiritual
    def gain_spiritual_method(num)
        self.spiritual += num
    end

    # spiritual down
    def spiritual_down_method(num)
        self.spiritual -= num
    end

end