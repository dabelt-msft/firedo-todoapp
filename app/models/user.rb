class User < ApplicationRecord
	has_secure_password
	validates :first_name, :email, presence: true

	has_many :todos

	accepts_nested_attributes_for :todos, reject_if: proc { |attributes| attributes['description'].blank? }

	def total_nominal_priority 
		self.todos.sum(:nominal_priority)
	end

	def total_allotted_time
		self.todos.sum(:total_allotted_time_in_hours)
	end

	def update_priority
		if self.todos.count == 0
			return 1
		else
			return (1 - (self.todos. / items.totalHours)) * this.nominalPriority;


		self.todos.each do |todo|
			self.todos.calculated_priority = (1 - (todo.allotted_time_in_hours / total_allotted_time)) * todo.nominal_priority 
		end
	end

	#     t.integer :nominal_priority
    # 	t.integer :user_id
    # 	t.string :description
    # 	t.float :allotted_time_in_hours
    #   t.string :dependencies
    #   t.float :calculated_priority

	
end
