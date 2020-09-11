class Item < ActiveRecord::Base
    
    has_many :useritems
    has_many :users, through: :useritems

    @@Inventory = []

    def generate_items
        self.bow = 1
        self.arrow = rand(2..5)
        self.spear = rand(2)
        self.fruit = rand(1..3)
        Inventory << self.generate_items
    end

    def self.add_to_items(item)
        @@Inventory << item.to_i
    end

    def check_items
        puts "You have #{Inventory.all} on you."
    end

end