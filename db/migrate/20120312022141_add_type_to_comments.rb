class AddTypeToComments < ActiveRecord::Migration
  def change
    add_column :comments, :ctype, :boolean
  end
end
