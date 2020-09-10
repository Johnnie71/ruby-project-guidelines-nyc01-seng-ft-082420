class Item < ActiveRecord::Base
    has_many :useritems
    has_many :user, through: :useritems

    
end