class CreateUseritemsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :useritems do |t|
      t.integer :user_id
      t.integer :item_id
    end
  end 
end

