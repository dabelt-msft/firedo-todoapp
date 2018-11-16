class User < ApplicationRecord
	has_secure_password
	validates :first_name, :email, presence: true

	has_many :todos

	accepts_nested_attributes_for :todos, reject_if: proc { |attributes| attributes['description'].blank? }

	def total_nominal_priority 
		self.todos.sum(:nominal_priority)
	end

	def total_allotted_time
		self.todos.sum(:allotted_time_in_hours)
	end

	def update_priority
		self.todos.each do |todo|
			@calculated_priority = self.todos.count == 0 ? 1 : (1 - (todo.allotted_time_in_hours / total_allotted_time)) * todo.nominal_priority
			todo.update(calculated_priority: @calculated_priority) 
		end
	end

	#     t.integer :nominal_priority
    # 	t.integer :user_id
    # 	t.string :description
    # 	t.float :allotted_time_in_hours
    #   t.string :dependencies
    #   t.float :calculated_priority

	
end
