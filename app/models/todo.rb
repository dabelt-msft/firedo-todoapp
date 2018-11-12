class Todo < ApplicationRecord
	belongs_to :user
	#remember to add validate user presence
end
