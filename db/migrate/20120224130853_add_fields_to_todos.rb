class AddFieldsToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :level, :string
  end
end
