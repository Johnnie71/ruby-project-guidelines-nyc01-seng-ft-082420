class Item < ActiveRecord::Base
    has_many :useritems
    has_many :users, through: :useritems

    Inventory = []

    def generate_items
        self.bow = 1
        self.arrow = rand(2..5)
        self.spear = rand(2)
        self.fruit = rand(1..3)
        Inventory << self.generate_items
        puts "You have #{Inventory} on you."
    end

    def add_to_items(item)
        Inventory << item
    end

    def check_items
        puts "You have #{Inventory.all} on you."
    end

end