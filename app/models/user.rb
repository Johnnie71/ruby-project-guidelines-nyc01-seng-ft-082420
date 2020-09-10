class User < ActiveRecord::Base
    has_many :useritems
    has_many :item, through: :useritems


    attr_writer :skill

    def generate_stats
        stats = {
            :stats => {
                :skill => 10,
                :energy => 10,
                :cleanliness => 10,
                :spiritual => 10,
                }
              }
    end

 
    def gain_skill_method(num)
        # stats.each do |index, value|
        #     [:stats][:skill]
        # self.generate_stats[:stats][:skill] += num
    end

    # gain energy
    def gain_energy_method(num)
        energy = 8
        self.energy += num
    end

    # energy down
    def energy_down_method(num)
        energy = 8
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

