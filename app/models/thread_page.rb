class ThreadPage < ApplicationRecord
	belongs_to :forum_thread, :class_name => 'FourmThread', :foreign_key => 'forum_thread_id'

	def to_param
		page_num
	end
end
