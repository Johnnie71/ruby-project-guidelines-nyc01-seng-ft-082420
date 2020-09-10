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
        puts "Welcome!!"
        sleep(2)
    end

    def login_or_signup
        puts "Enter name to login or sign up!"
        answer = gets.chomp.downcase
        @user = User.find_or_create_by(user_name: answer)
        if @user == User.create 
            stats << generate_stats
            # will also need some way of tying in items...unsure how
        sleep(1)
        puts "Welcome, #{@user.user_name}!!!" 
        sleep(3)
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


    def train 
        system "clear"
        prompt = TTY::Prompt.new(active_color: :cyan)
        puts "Pick and activity!?"
        @train_options = [
            {"Fly through the Hallelujah Mountains?" => -> do (gain_skill_method(2)) end},
            {"Glide over the icy blue lagoon?" => -> do (energy_down_method(1)) end},
            {"Leave Mountain Banshee to rest?" => -> do adventures end} 
        ]
        prompt.select("", @train_options)
    end


    def forest
        system "clear"
        prompt = TTY::Prompt.new(active_color: :bright_magenta)
        puts "Beautful! Isn't it...What would you like the do?"
        sleep(1)
        @forest_options = [
            {"Walk through bushery" => -> do (energy_down_method(1)) end},
            {"Stroll into the bioluminescent pathway" => -> do (gain_energy_method(2)) end},
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
            {"Go for a dive" => -> do (gain_cleanliness_method(2)) && (energy_down_method(1)) end},
            {"Go and hunt for fish" => -> do (gain_skill_method(3)) && (spiritual_down_method(5)) end},
            {"Play with fellow Navi" => -> do (gain_spiritual_method(5)) end},
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
            {"Meditate under the Tree of Souls" => -> do (gain_spiritual_method(4)) && (gain_energy_method(2)) end},
            # {"Connect with Ewya through the Tree"}, #this needs to save/delete data
            {"Leave the Tree" => -> do adventures end}
            ]
        prompt.select("", @visit_options) 
    end 

   end  
end