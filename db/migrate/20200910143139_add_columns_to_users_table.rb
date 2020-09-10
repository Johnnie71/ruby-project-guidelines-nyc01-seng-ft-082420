class AddColumnsToUsersTable < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :skill, :integer
  end
end
