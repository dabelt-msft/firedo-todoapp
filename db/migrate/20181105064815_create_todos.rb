class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.integer :nominal_priority
    	t.integer :user_id
    	t.string :description
    	t.integer :allotted_time_in_hours
    	t.string :dependencies
      t.timestamps
    end
  end
end
