class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :category
      t.text :description
      t.string :request_team
      t.string :request_user
      t.string :owner
      t.string :status
      t.date :started
      t.date :due
      t.date :finished
      t.text :note
      t.references :author

      t.timestamps
    end
    add_index :todos, :author_id
  end
end
