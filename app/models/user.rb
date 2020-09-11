class User < ActiveRecord::Base

    has_many :useritems 
    has_many :items, through: :useritems

    def stats 
        self.skill
        self.health 
        self.cleanliness
        self.spirituality 
    end

    def generate_stats
        self.skill = rand(1..5)
        self.health = rand(1..5)
        self.cleanliness = rand(1..5)
        self.spirituality = rand(1..5)
    end


    ##THANATOR =============================================================
    def thanator
        prompt = TTY::Prompt.new(active_color: :bright_red)
        puts "Uh oh I think there's eyes on you..."
        # music plays
        sleep(1)
        # image pops up
        puts "A Thanator, Pandora's apex predator roars and charges at you."
        sleep(1)
        puts "What will you do?"
        sleep(0.5)
        @thanator_options = [
            {"Fight" => -> do (thanator_fight) end},
            {"Run for it!" => -> do (thanator_run) end}
        ]
        prompt.select("", @thanator_options)
    end

    def thanator_fight
        system "clear"
        prompt = TTY::Prompt.new(active_color: :yellow)
        puts "You find a bow and some arrows on the ground. Did someone drop these?"
        sleep(1)
        puts "You pick these up and take aim. The first misses the Thanator!!!" 
        sleep(1)
        puts "BUT! The second wounds them. The Thanator retreats and you manage to escape!"
        lower_health
        bow = 0
        arrow = 0
        Item.add_to_items(bow += 1)
        Item.add_to_items(arrow += 1) 
        sleep(1)
        # system "clear"
        prompt = TTY::Prompt.new(active_color: :yellow)
        puts "Where would you like to go to now?"
        @after_fight_options = [
            {"Head back!" => -> do (Avatargame.forest) end},
            {"Another adventure?" => -> do (adventures) end}
        ]
        prompt.select("", @after_fight_options)
        # @Avatargame.forest
    end   

    def thanator_run
        puts "You run for it! The Thanator chases but it can't catch up!" 
        sleep(1)    
        self.lower_cleanliness
        puts "That was close!! Think you're kind of dirty now..."
        sleep(1)
        puts "Maybe check out the river?"
        sleep(1)
        adventures
    end

    ##SWIM=====================================================
    
    # def spear_fish
        # puts 
    # end


    ##STATS ===================================================

    def gain_skill
        puts "Your skill was #{self.skill}."
        self.skill += [2,3,4].sample 
        sleep(1)
        puts "Your skill is now #{self.skill}!!"
        sleep(1)
        puts ":)"
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

    def lower_cleanliness
        puts "Your cleanliness was #{self.cleanliness}."
        self.cleanliness -= rand(1..3)
        puts "Now your cleanliness is now #{self.cleanliness}!"
        sleep(1)
    end

    def gain_spiritualty
        puts "Your spirituality was #{self.spirituality}."
        self.spirituality += rand(1..3)
        sleep(1)
        puts "Your spirituality is now #{self.spirituality}!"
    end

    def lower_spirituality
        puts "Your spirituality was #{self.spirituality}."
        self.spirituality -= rand(1..3)
        sleep(1)
        puts "Your spirituality is #{self.spirituality} :("
    end

## SAVE/DELETE=======================================================
    # def save_data
            # self.save
        # puts "Thank you for saving! See you soon"
    # end

# binding.pry
end

