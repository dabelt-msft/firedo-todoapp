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
		params_todo = {
			user_id: current_user.id,
			id: todo_params[:id],
			description: todo_params[:description],
			nominal_priority: todo_params[:nominal_priority],
			allotted_time_in_hours: todo_params[:allotted_time_in_hours],
			dependencies: todo_params[:dependencies]
		}
		t = Todo.create(params_todo)
		if t.save
			redirect_to "/users/#{current_user.id}/todos"
		end
	end

	def edit
		@todo = Todo.find_by(id: params[:id], user_id: params[:user_id])
	end

	def update
		todo = Todo.find_by(id: params[:id], user_id: current_user.id)
		todo.update(todo_params)
		if todo.save
			redirect_to "/users/#{current_user.id}/todos"
		end
	end

	def destroy
		todo = Todo.find_by(id: params[:id], user_id: current_user.id)
		todo.delete
		redirect_to "/users/#{current_user.id}/todos"
	end

	def todo_params
    	params.require(:todo).permit(:nominal_priority, :description, :allotted_time_in_hours, :dependencies)
  	end
end