class Post < ApplicationRecord
	belongs_to :thread_page, :class_name => 'ThreadPage', :foreign_key => 'thread_page_id'
end
