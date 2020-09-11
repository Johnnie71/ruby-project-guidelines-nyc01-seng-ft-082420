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

    def see_stats
        puts "Skill: #{self.skill}"
        puts "Health: #{self.health}"
        puts "Cleanliness: #{self.cleanliness}"
        puts "Spirituality: #{self.spirituality}"
    end

    def user_exit 
        exit!
    end


    ##THANATOR =============================================================
    # def thanator
    #     prompt = TTY::Prompt.new(active_color: :bright_red)
    #     puts "Uh oh I think there's eyes on you..."
    #     # music plays
    #     sleep(1)
    #     # image pops up
    #     puts "A Thanator, Pandora's apex predator roars and charges at you."
    #     sleep(1)
    #     puts "What will you do?"
    #     sleep(0.5)
    #     @thanator_options = [
    #         {"Fight" => -> do (thanator_fight) end},
    #         {"Run for it!" => -> do (thanator_run) end}
    #     ]
    #     prompt.select("", @thanator_options)
    # end

    # def thanator_fight
    #     system "clear"
    #     prompt = TTY::Prompt.new(active_color: :yellow)
    #     puts "You find a bow and some arrows on the ground. Did someone drop these?"
    #     sleep(1)
    #     puts "You pick these up and take aim. The first misses the Thanator!!!" 
    #     sleep(1)
    #     puts "BUT! The second wounds them. The Thanator retreats and you manage to escape!"
    #     lower_health
    #     bow = 0
    #     arrow = 0
    #     Item.add_to_items(bow += 1)
    #     Item.add_to_items(arrow += 1) 
    #     sleep(1)
    #     # system "clear"
    #     prompt = TTY::Prompt.new(active_color: :yellow)
    #     puts "Where would you like to go to now?"
    #     @after_fight_options = [
    #         {"Head back!" => -> do (forest) end},
    #         {"Another adventure?" => -> do (adventures) end}
    #     ]
    #     prompt.select("", @after_fight_options)
    #     # @Avatargame.forest
    # end   

    # def thanator_run
    #     puts "You run for it! The Thanator chases but it can't catch up!" 
    #     sleep(1)    
    #     self.lower_cleanliness
    #     puts "That was close!! Think you're kind of dirty now..."
    #     sleep(1)
    #     puts "Maybe check out the river?"
    #     sleep(1)
    #     adventures
    # end

    ##SWIM=====================================================
    

    def go_for_a_dive
        prompt = TTY::Prompt.new(active_color: :blue)
        puts "The water is refreshing. You feel clean and relaxed now!"
        self.gain_cleanliness
        self.lower_health
        sleep(1)
        @after_dive_options = [
            {"Head back now?" => -> do (forest) end},
            {"Another adventure?" => -> do (adventures) end}
        ]
        prompt.select("", @after_dive_options)
    end

    def hunt_for_fish
        prompt = TTY::Prompt.new(active_color: :blue)
        puts "Time to go fishing!"
        sleep(1)
        puts "There are a few spears over there. Why not try your luck?"
        # picks up spear
        puts "You pick up a spear. There are a few fish swimming not far from you."
        puts "You take aim..."
        sleep(1)
        puts "You catch a fish! Must be beginner's luck"
        self.gain_skill
        self.lower_spirituality
        spear = 0
        Item.add_to_items(spear += 1)
        sleep(1)
        @after_hunt_for_fish_options = [
            {"Head baack to land?" => -> do (swim) end},
            {"Go on another adventure?" => -> do (adventures) end}
        ]
        prompt.select("", @after_hunt_for_fish_options)
    end

    def play_with_navi
        prompt = TTY::Prompt.new(active_color: :blue)
        puts "A few of your fellow Navi are playing in the river!"
        sleep(1)
        puts "Why don't you join them?"
        sleep(1)
        self.gain_spiritualty
        @after_play_with_navi_options = [
            {"Head back to land?" => -> do (swim) end},
            {"Go on another adventure?" => -> do (adventures) end}
        ]
        prompt.selec("", @after_play_with_navi_options)
    end
    
    ##Tree of Souls=============================================
    def meditate
        prompt = TTY::Prompt.new(active_color: :magenta)
        system "clear"
        puts "This is nice!"
        sleep(1)
        puts "Now close your eyes....."
        self.gain_spiritualty
        self.gain_health
        puts "....."
        sleep(3)
        puts "All done :)"
        @after_meditate_options = [
            {"Wonder around the Tree a bit more?" => -> do (visit) end},
            {"Go on another adventure?" => -> do (Avatargame.adventures) end}
        ]
        prompt.select("", @after_meditate_options)

    end

    # def connect_with_ewya
    #     prompt = TTY::Prompt.new(active_color: :magenta)
    #     system "clear"
    #     puts "Lets save your adventure!!"
    #     sleep(1)
    #     spinner = TTY::Spinner.new("[:spinner] Saving...", format: :pulse_2)
    #     spinner.auto_spin
    #     sleep(2)
    #     self.save
    #     spinner.stop("Done! Thank you for saving")
    #     sleep(1)
    #     puts "We hope you'll visit again soon!"
    #     @after_save_options = [
    #         {"Wonder around the Tree a bit more?" => -> do (visit) end},
    #         {"Exit!" => -> do (adventures) end}
    #     ]
    #     prompt.select("", @after_meditate_options)

        
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

    def gain_spirituality
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

# ## SAVE/DELETE=======================================================
    # def save_data
    #     puts "Thank you for saving! See you soon"
    #     self.save
    # end

# binding.pry

    def play_music
        pid = fork{exec 'afplay', "lib/Purespiritsoftheforest.mp3"}
    end

    def end_music
        pid = fork{ exec ‘killall’, “afplay” }
    end
end

