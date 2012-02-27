class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :author
      t.references :todo

      t.timestamps
    end
    add_index :comments, :author_id
    add_index :comments, :todo_id
  end
end
