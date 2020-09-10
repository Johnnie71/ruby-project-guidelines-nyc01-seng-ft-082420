class AddColumnsToItemsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :bow, :integer
    add_column :items, :arrows, :integer
    add_column :items, :spears, :integer
    add_column :items, :fruit, :integer
  end
end
