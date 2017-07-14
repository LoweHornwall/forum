class Post < ApplicationRecord
	belongs_to :thread_page, :class_name => 'ThreadPage', :foreign_key => 'thread_page_id'
	belongs_to :forum_thread, :class_name => 'ForumThread', :foreign_key => 'forum_thread_id'

	validates :creator_id, :message, presence: true
end
