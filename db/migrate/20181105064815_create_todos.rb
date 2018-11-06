class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
    	t.integer :todo_id
    	t.integer :user_id
    	t.string :description
    	t.integer :alloted_time_in_hours
    	t.string :dependencies

      t.timestamps
    end
  end
end
