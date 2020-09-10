class Avatargame

    prompt = TTY::Prompt.new

    attr_reader :user

    def run
        welcome
        login_or_signup
        adventures
    end

    
private 

    def welcome
        puts "Welcome!!"
        sleep(2)
    end

    def login_or_signup
        puts "Enter name to login or sign up!"
        answer = gets.chomp.downcase
        @user = User.find_or_create_by(user_name: answer)
        sleep(1)
        puts "Welcome, #{@user.user_name}!!!"
        sleep(3)
    end

    def adventures
        # system "clear"
          prompt = TTY::Prompt.new
          puts "Where would you like to venture off too today!?"
          @adventure = [
              {"Train your Mountain Banshee in the air" => -> do train end},
              {"Enter the magical forest on your DireHorse?" => -> do forest end},
              {"Swim along the mystical river?" => -> do swim end},
              {"Visit the Tree of Souls?" => -> do visit end}
          ]
          prompt.select("", @adventure)
        
    end

    def train 
        prompt = TTY::Prompt.new
        puts "Pick and activity!?"
        @train_options = [
            {"Fly through the Hallelujah Mountains?" => -> do (gain_skill_method) end},
            {"Glide over the icy blue lagoon?" => -> do (energy_down_method) end},
            {"Leave Mountain Banshee to rest?" => -> do adventures end} 
        ]
        prompt.select("", @train_options)

    end

    def forest
        prompt = TTY::Prompt.new
        puts "Beautful! Isn't it...What would you like the do?"
        sleep(1)
        @forest_options = [
            {"Walk through bushery" => -> do (energy_down_method) end},
            {"Stroll into the bioluminescent pathway" => -> do (gain_energy_method) end},
            {"Leave forest" => -> do adventures end}
        ]
        prompt.select("", @forest_options) 
    end

    def swim
        prompt = TTY::Prompt.new
        puts "A swim, huh?"
        sleep(1)
        puts "what would you like to do in the water?"
        @swim_options = [
            {"Go for a dive" => -> do (gain_cleanliness_method) && (energy_down_method) end},
            {"Go and hunt for fish" => -> do (gain_skill_method) && (spiritual_down_method) end},
            {"Play with fellow Navi" => -> do (gain_spiritual_method) end},
            {"Leave the ocean" => -> do adventures end}
        ]
        prompt.select("", @swim_options) 
    end

    def visit
        prompt = TTY::Prompt.new
        puts "Welcome to the Tree of Souls. Here, the Navi may feel closest to Ewya"
        sleep (1)
        puts "What would you like to do here?"
        @visit_options = [
            {"Meditate under the Tree of Souls" => -> do (gain_gain_spiritual_method) && (gain_energy_method) end},
            # {"Connect with Ewya through the Tree"}, #this needs to save/delete data
            {"Leave the Tree" => -> do adventures end}
            ]
        prompt.select("", @visit_options) 
    end 
we just have to make our other methods now







end