user1 = User.create!( first_name: "derik",
			  last_name: "thompson",
			  email: "b@b.com")

user2 = User.create!( first_name: "ciara",
			  last_name: "norman",
			  email: "c@c.com")

user3 = User.create!( first_name: "bob",
			  last_name: "cat",
			  email: "d@d.com")

todo1 = Todo.create!( 
			user_id: user1.id,
			nominal_priority: 10,
			description: "send email to clients",
			allotted_time_in_hours: 1,
			user: User.find(rand(User.count)+1),
			dependencies: "get email address list")

todo2 = Todo.create!( 
			user_id: user1.id,
			nominal_priority: 5,
			description: "other stuff",
			allotted_time_in_hours: 10,
			user: User.find(rand(User.count)+1),
			dependencies: "some other things")

todo3 = Todo.create!( 
			user_id: user1.id,
			nominal_priority: 5,
			description: "to do description",
			allotted_time_in_hours: 1,
			user: User.find(rand(User.count)+1),
			dependencies: "required steps")