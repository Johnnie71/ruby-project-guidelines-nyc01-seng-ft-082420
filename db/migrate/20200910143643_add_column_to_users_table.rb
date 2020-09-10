class AddColumnToUsersTable < ActiveRecord::Migration[6.0]
  def change
      add_column :users, :health, :integer
      add_column :users, :cleanliness, :integer
      add_column :users, :spirituality, :integer
  end
end
