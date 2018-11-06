json.extract! todo, :id, :nominal_priority, :description, :allotted_time_in_hours, :dependencies, :created_at, :updated_at
json.url todo_url(todo, format: :json)
