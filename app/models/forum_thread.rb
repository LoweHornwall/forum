class ForumThread < ApplicationRecord
	belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
	has_many :thread_pages
	has_many :posts, through: :thread_pages

	def to_param
		name
	end	
end
