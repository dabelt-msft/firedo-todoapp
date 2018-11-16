class TodosController < ApplicationController
	before_action :set_user, only: [:update, :destroy]
	before_action :set_todo, only: [:edit, :update, :destroy]

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
		todo = Todo.create(params_todo)
		p todo
		if todo.save
			todo.user.update_priority
			redirect_to "/users/#{current_user.id}/todos"
		end
	end

	def edit
	end

	def update
		@todo.update(todo_params)
		if @todo.save
			@user.update_priority
			redirect_to "/users/#{current_user.id}/todos"
		end
	end

	def destroy
		@todo.delete
		@user.update_priority
		redirect_to "/users/#{current_user.id}/todos"
	end

private
	def todo_params
    	params.require(:todo).permit(:nominal_priority, :description, :allotted_time_in_hours, :dependencies)
	end

	def set_todo
		@todo = Todo.find_by(id: params[:id], user_id: params[:user_id])
	end

	def set_user
		todo = Todo.find_by(id: params[:id], user_id: params[:user_id])
		@user = todo.user
	end

	def update_todos
		todo = Todo.find_by(id: params[:id], user_id: params[:user_id])
	end
end