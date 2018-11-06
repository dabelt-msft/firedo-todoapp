User.create!( first_name: "derik",
			  last_name: "thompson",
			  email: "b@b.com")

User.create!( first_name: "ciara",
			  last_name: "norman",
			  email: "c@c.com")

User.create!( first_name: "bob",
			  last_name: "cat",
			  email: "d@d.com")

Todo.create!( description: "task 1: send email to clients",
    	      alloted_time_in_hours: 2,
    	      user: User.find(rand(User.count)+1),
    		  dependencies: "get email address list")

Todo.create!( description: "task 2: other stuff",
    	      alloted_time_in_hours: 30,
    	      user: User.find(rand(User.count)+1),
    		  dependencies: "some other things")

Todo.create!( description: "task 3: to do description",
    	      alloted_time_in_hours: 1,
    	      user: User.find(rand(User.count)+1),
    		  dependencies: "required steps")