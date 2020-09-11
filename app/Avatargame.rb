require 'pry'

class Avatargame

    prompt = TTY::Prompt.new

    attr_reader :user

    def run
        play_beginning_music
        welcome
        login_or_signup
        adventures
    end

    
  private 

    def welcome
        puts "Welcome!!"
        sleep(2)
    end

    # def login_or_signup
    #     puts "Enter name to login or sign up!"
    #     answer = gets.chomp.downcase
    #     @user = User.find_or_create_by(user_name: answer)
    #     if @user.stats == nil 
    #         @user.generate_stats
    #         @item.generate_items
    #         @user.save
    #         puts "Welcome to Pandora, #{@user.user_name}!"
    #         sleep(1)
    #         puts "Your adventure awaits!"
    #     # OpeningEyes.go
    #     # User.find(@user_name)  #maybe look for instance in the class instead?
    #     else
    #         puts "Welcome back to Pandora, #{@user.user_name}!"
    #         sleep(1)
    #         puts "We've missed you!!"
    #     end
    #         # else 
    #         #     @user.generate_stats
    #         #     @user.generate_items
    #         #     puts "Welcome to Pandora, #{@user.user_name}"
    #         # end
    #     # if @user == User.create 
    #     #     User.generate_stats       
    #     #     Items.generate_items       
    #         # adventures
    #     # elsif 
    #     #     puts "Welcome to Pandora #{@user.user_name}!!!"
    #     sleep(2)
    #     # end
    # end

    def login_or_signup
        puts "Enter name to login or sign up!"
        answer = gets.chomp.downcase
        @user = User.find_or_create_by(user_name: answer)
        @user.generate_stats
        # OpeningEyes.go
        if @user == User.create 
            User.generate_stats       
            Items.generate_items        
            #for new user this message is supposed to pop up
            adventures
        else
            puts "Welcome, back to Pandora, #{@user.user_name}!"
            #for user that already exists
            sleep(1)
            puts "We've missed you!"
            sleep(2)
            adventures
        end 
        sleep(2)
    end

    def adventures
        system "clear"
        spinner = TTY::Spinner.new("[:spinner] Loading...", format: :pulse_2)
        spinner.auto_spin
        sleep (1)
        spinner.stop
        system "clear"
        prompt = TTY::Prompt.new(active_color: :cyan)
        puts "Where would you like to venture off too today!?"
            @adventure = [
                {"Train your Mountain Banshee in the air" => -> do train end},
                {"Enter the magical forest on your DireHorse?" => -> do forest end},
                {"Swim along the mystical river?" => -> do swim end},
                {"Visit the Tree of Souls?" => -> do visit end}
                ]
        prompt.select("", @adventure)
    end  

    ##Train========================================

    def train 
        system "clear"
        prompt = TTY::Prompt.new(active_color: :cyan)
        puts "Pick an activity!?"
        @train_options = [
            {"Fly through the Hallelujah Mountains?" => -> do (fly_through) end},
            {"Glide over the Icy Blue Lagoon?" => ->  do (glide_over) end},
            {"Leave Mountain Banshee to rest?" => -> do adventures end} 
        ]
        prompt.select("", @train_options)
    
    end

    #Train Options ====================================

    def fly_through
        system "clear"
        prompt = TTY::Prompt.new(active_color: :bright_blue)
        puts "Leetttttsss gooooo!!!!"
        sleep(1) 
        puts "Swoooossssshhhhh"
        sleep (1)
        puts "Woaaahhh buddy your fast!!!!"
        sleep(1)
        puts "Ok now lets go for a break!!"
        @user.gain_skill 
        puts "What would you like to do now!?"
        sleep(1)
        puts ":)"
        @after_flight_options = [
            {"Head back to train some more?" => -> do (train) end},
            {"Another Adventure???" => ->  do (adventures) end}
            
        ]
        prompt.select("", @after_flight_options)
    end

    def glide_over
        system "clear"
        prompt = TTY::Prompt.new(active_color: :bright_blue)
        puts "You feel a cool breeze as you glide over the lagoon."
        sleep(1)
        puts "You take a deep inhale of the crisp air."
        sleep(1)
        puts "You feel awake and refreshed. Time to head back!"
        @user.gain_spirituality
        puts "Where would you like to go next?"
        sleep(1)
        @after_gliding_options = [
            {"Train with your Mountain Banshee?" => -> do (train) end},
            {"Explore Pandora?" => -> do (adventures) end}
        ]
        prompt.select("", @after_gliding_options)
    end

##Forest============================================
    
    def forest
        system "clear"
        prompt = TTY::Prompt.new(active_color: :bright_magenta)
        puts "Beautiful! Isn't it...What would you like to do?"
        sleep(1)
        @forest_options = [
            {"Walk through bushery" => -> do (thanator) end},
            {"Stroll into the bioluminescent pathway" => -> do (pathway) end},
            {"Leave forest" => -> do adventures end}
        ]
        prompt.select("", @forest_options) 
    end

    ###Forest Options==============

    # Thanator===============
    def thanator
        system "clear"
        prompt = TTY::Prompt.new(active_color: :bright_red)
        puts "Uh oh I think there's eyes on you..."
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
        @user.lower_health
        bow = 0
        arrow = 0
        Item.add_to_items(bow += 1)
        Item.add_to_items(arrow += 1) 
        sleep(1)
        puts "Where would you like to go to now?"
        @after_fight_options = [
            {"Head back!" => -> do (forest) end},
            {"Another adventure?" => -> do (adventures) end}
        ]
        prompt.select("", @after_fight_options)
    end   

    def thanator_run
        system "clear"
        puts "You run for it! The Thanator chases but it can't catch up!" 
        sleep(1)    
        @user.lower_cleanliness
        puts "That was close!! Think you're kind of dirty now..."
        sleep(1)
        puts "Maybe check out the river?"
        sleep(1)
        adventures
    end

    ##Pathway Options==========================================

    def pathway
        system "clear"
        prompt = TTY::Prompt.new(active_color: :bright_magenta)
        puts "Wooooow!! Can we just live here forevvvaa!!??"
        sleep(1)
        puts "Oh! Look!! There is fruit!! Take it!!"
        sleep(1)
        @user.gain_health
        puts "That was good and refreshing!!"
        sleep(3)
        puts "Where would you like to go now?"
        @after_pathway_options = [
            {"Head back!" => -> do (forest) end},
            {"Another adventure?" => -> do (adventures) end}
        ]
        prompt.select("", @after_pathway_options)
    
    end


    ##Swim=============================================

    def swim
        system "clear"
        # prompt = TTY::Prompt.new
        prompt = TTY::Prompt.new(active_color: :cyan)
        puts "A swim, huh?"
        sleep(1)
        puts "What would you like to do in the water?"
        @swim_options = [
            {"Go for a dive" => -> do (go_for_a_dive) end},
            {"Go and hunt for fish" => -> do (hunt_for_fish) end},
            {"Play with fellow Navi" => -> do (play_with_navi) end},
            {"Leave the river" => -> do adventures end}
        ]
        prompt.select("", @swim_options) 
    end

    ##swim options==================================================
    def go_for_a_dive
        system "clear"
        prompt = TTY::Prompt.new(active_color: :blue)
        sleep(1)
        puts "The water is refreshing. You feel clean and relaxed now!"
        sleep(2)
        @user.gain_cleanliness
        sleep(1)
        @user.lower_health
        sleep(3)
        puts "What would you like to do now!?"
        @after_dive_options = [
            {"Head back now?" => -> do (swim) end},
            {"Another adventure?" => -> do (adventures) end}
        ]
        prompt.select("", @after_dive_options)
    end

    def hunt_for_fish
        system "clear"
        prompt = TTY::Prompt.new(active_color: :blue)
        puts "Time to go fishing!"
        sleep(1)
        puts "There are a few spears over there. Why not try your luck?"
        puts "You pick up a spear. There are a few fish swimming not far from you."
        puts "You take aim..."
        sleep(1)
        puts "You catch a fish! Must be beginner's luck"
        @user.gain_skill
        @user.lower_spirituality
        spear = 0
        Item.add_to_items(spear += 1)
        sleep(1)
        @after_hunt_for_fish_options = [
            {"Head back to land?" => -> do (swim) end},
            {"Go on another adventure?" => -> do (adventures) end}
        ]
        prompt.select("", @after_hunt_for_fish_options)
    end

    def play_with_navi
        system "clear"
        prompt = TTY::Prompt.new(active_color: :blue)
        puts "A few of your fellow Navi are playing in the river!"
        sleep(1)
        puts "Why don't you join them?"
        sleep(1)
        @user.gain_spirituality
        @after_play_with_navi_options = [
            {"Head back to land?" => -> do (swim) end},
            {"Go on another adventure?" => -> do (adventures) end}
        ]
        prompt.select("", @after_play_with_navi_options)
    end

    ###Tree of Souls======================================

    def visit
        system "clear"
        prompt = TTY::Prompt.new(active_color: :magenta)
        puts "Welcome to the Tree of Souls. Here, the Navi may feel closest to Ewya"
        sleep (1)
        puts "What would you like to do here?"
        @visit_options = [
            {"Meditate under the Tree of Souls" => -> do (meditate) end},
            {"Connect with Ewya through the Tree" => -> do (connect_with_ewya) end},
            {"See my stats" => -> do (see_stats_and_back) end},
            {"Leave the Tree" => -> do adventures end}
            ]
        prompt.select("", @visit_options) 
    end 

    ### Tree Options=========================
    def meditate
        system "clear"
        prompt = TTY::Prompt.new(active_color: :magenta)
        puts "This is nice!"
        sleep(2)
        puts "Now close your eyes....."
        sleep(3)
        @user.gain_spirituality
        @user.gain_health
        puts "....."
        sleep(3)
        puts "One with Ewya!!! :)"
        @after_meditate_options = [
            {"Wonder around the Tree a bit more?" => -> do (visit) end},
            {"Go on another adventure?" => -> do (adventures) end}
        ]
        prompt.select("", @after_meditate_options)
    end
    
    def connect_with_ewya
        system "clear"
        prompt = TTY::Prompt.new(active_color: :magenta)
        puts "Lets save your adventure!!"
        sleep(1)
        spinner = TTY::Spinner.new("[:spinner] Saving...", format: :pulse_2)
        spinner.auto_spin
        sleep(2)
        @user.save
        spinner.stop("Done! Thank you for saving")
        sleep(1)
        puts "We hope you'll visit again soon!"
        @after_save_options = [
            {"Wander around the Tree a bit more?" => -> do (visit) end},
            {"Exit!" => -> do (user_exit) end} 
        ]
        prompt.select("", @after_save_options)
    end

    def see_stats_and_back
        prompt = TTY::Prompt.new(active_color: :magenta)
        system "clear"
        puts "Please wait as we load your stats..."
        sleep(2)
        @user.see_stats
        sleep(2)
        puts "What would you like to do next?"
        @after_stats_options = [
            {"Wander around the Tree" => -> do (visit) end},
            {"Go on an adventure!" => -> do (adventures) end}
        ]
        prompt.select("", @after_stats_options)
    end
    ###

    def user_exit 
        puts "Until next time!!!!"
        sleep(1)
        exit!
        end_beginning_music
    end

    def play_beginning_music
        pid = fork{ system 'afplay', "lib/jakeavatarworld.mp3"}
    end
    def end_beginning_music
        pid = fork{ system ‘killall’, “afplay” }
    end

    def play_forest_music
        pid = fork{ system 'afplay', "lib/Purespiritsoftheforest.mp3"}
    end

    def end_forest_music
        pid = fork{ system ‘killall’, “afplay” }
    end

end