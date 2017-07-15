class Forum < ApplicationRecord
	has_many :forum_threads

	def to_param
		name
	end	
end
