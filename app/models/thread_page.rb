class ThreadPage < ApplicationRecord
	belongs_to :forum_thread, :class_name => 'ForumThread', :foreign_key => 'forum_thread_id'
	has_many :posts
	
	def to_param
		page_num
	end
end
