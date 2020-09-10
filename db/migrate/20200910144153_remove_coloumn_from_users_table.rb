class RemoveColoumnFromUsersTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :stats, :integer
  end
end
