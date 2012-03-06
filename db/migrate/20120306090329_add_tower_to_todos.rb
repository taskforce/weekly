class AddTowerToTodos < ActiveRecord::Migration
  def change
    rename_column :todos, :category, :tower
    add_column :todos, :category, :string
  end
end
