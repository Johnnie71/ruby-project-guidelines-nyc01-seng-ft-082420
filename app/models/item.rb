class Item < ActiveRecord::Base
    has_many :useritems
    has_many :user, through: :useritems

    # some method to auto generate items when user is generated?
    

end