class Forum < ApplicationRecord
	has_many :forum_threads
	validates :name, uniqueness: true, presence: true
	def to_param
		name
	end	
end
