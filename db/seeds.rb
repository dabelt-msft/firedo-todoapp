def range (min, max)
	rand * (max-min) + min
end

100.times do 
	User.create!(
		first_name: Faker::StarTrek.character,
		last_name: Faker::StarTrek.character,
		email: Faker::Internet.email,
		password: "p"
	)
end

100.times do
	Todo.create!(
		nominal_priority: rand(11),
		description: Faker::Company.bs #=> "empower one-to-one web-readiness",
		allotted_time_in_hours: range(0,3),
		user: User.find(rand(User.count)+1),
		dependencies: "get email address list"
	)
end