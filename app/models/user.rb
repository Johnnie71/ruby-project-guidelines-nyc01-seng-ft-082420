class User < ActiveRecord::Base

    has_many :useritems 
    has_many :items, through: :useritems

    def generate_stats
        self.skill = rand(1..5)
        self.health = rand(1..5)
        self.cleanliness = rand(1..5)
        self.spirituality = rand(1..5)
    end


    def gain_skill
        puts "Your skill was #{self.skill}."
        self.skill += [2,3,4].sample 
        sleep(1)
        puts "Your skill is now #{self.skill}!!"
        sleep(1)
        puts ":)"
        # self.skill.rand(1..3)  
    end 

    def gain_health
        puts "Your health was #{self.health}."
        self.health += rand(1..3)
        sleep(1)
        puts "Your health is now #{self.health}! :)"
    end

    def lower_health
        puts "Your health was #{self.health}."
        self.health -= rand(1..3)
        sleep(1)
        puts "Your health is now.. #{self.health} :/"
    end
    
    def gain_cleanliness
        puts "Your cleanliness was #{self.cleanliness}."
        self.cleanliness += rand(1..3)
        puts "Now your cleanliness is now #{self.cleanliness}!"
        sleep(1)
        puts "aahhh :)"
    end 

    def gain_spiritualty
        puts "Your spirituality was #{self.spirituality}."
        self.spirituality += rand(1..3)
        sleep(1)
        puts "Your spirituality is now #{self.spirituality}!!"
    end

    def lower_spirituality
        puts "Your spirituality was #{self.spirituality}."
        self.spirituality -= rand(1..3)
        sleep(1)
        puts "Your spirituality is #{self.spirituality} :("
    end
# binding.pry
end

