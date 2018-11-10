class TodosController < ApplicationController
	def index
		if current_user
			@todos = current_user.todos
		end
	end

	def new
		@todo = Todo.new
	end

	def create
		t = Todo.new(user_id: current_user.id)
		t.update(todo_params)
		t.save
		redirect_to "/users/#{current_user.id}/todos"
	end

	def edit
	end

	def update
	end

	def delete
	end

	def todo_params
    	params.require(:todo).permit(:nominal_priority, :description, :allotted_time_in_hours, :dependencies)
  	end
end