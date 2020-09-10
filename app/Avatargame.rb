require 'pry'

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
        # pid = fork{ exec ‘afplay’, “https://www.youtube.com/watch?v=yIw6DSsaBIk&ab_channel=JamesHorner-Topic” } 
        puts "Welcome!!"
        sleep(2)
    end

    def login_or_signup
        puts "Enter name to login or sign up!"
        answer = gets.chomp.downcase
        @user = User.find_or_create_by(user_name: answer)
        @user.generate_stats
        if @user == User.create 
            User.generate_stats       
            Items.generate_items        
            #for new user this message is supposed to pop up
            adventures
        else
            puts "Welcome, back to Pandora!"
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
        sleep (1)
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
    # binding.pry

    def train 
        system "clear"
        prompt = TTY::Prompt.new(active_color: :cyan)
        puts "Pick an activity!?"
        @train_options = [
            {"Fly through the Hallelujah Mountains?" => -> do (@user.gain_skill) end},
            {"Glide over the Icy Blue Lagoon?" => ->  do (@user.lower_health) end},
            {"Leave Mountain Banshee to rest?" => -> do adventures end} 
        ]
        prompt.select("", @train_options)
    
    end


    def forest
        system "clear"
        prompt = TTY::Prompt.new(active_color: :bright_magenta)
        puts "Beautful! Isn't it...What would you like to do?"
        sleep(1)
        @forest_options = [
            {"Walk through bushery" => -> do (@user.lower_health) end},
            {"Stroll into the bioluminescent pathway" => -> do (@user.gain_health) end},
            {"Leave forest" => -> do adventures end}
        ]
        prompt.select("", @forest_options) 
    end


    def swim
        system "clear"
        # prompt = TTY::Prompt.new
        prompt = TTY::Prompt.new(active_color: :cyan)
        puts "A swim, huh?"
        sleep(1)
        puts "what would you like to do in the water?"
        @swim_options = [
            {"Go for a dive" => -> do (@user.gain_cleanliness) && (@user.lower_health) end},
            {"Go and hunt for fish" => -> do (@user.gain_skill) && (@user.lower_spirituality) end},
            {"Play with fellow Navi" => -> do (@user.gain_spiritualty) end},
            {"Leave the river" => -> do adventures end}
        ]
        prompt.select("", @swim_options) 
    end


    def visit
        system "clear"
        prompt = TTY::Prompt.new(active_color: :magenta)
        puts "Welcome to the Tree of Souls. Here, the Navi may feel closest to Ewya"
        sleep (1)
        puts "What would you like to do here?"
        @visit_options = [
            {"Meditate under the Tree of Souls" => -> do (@user.gain_spiritualty) && (@user.gain_health) end},
            # {"Connect with Ewya through the Tree"}, #this needs to save/delete data
                # some method @user.save/delete
            {"Leave the Tree" => -> do adventures end}
            ]
        prompt.select("", @visit_options) 
    end 



end