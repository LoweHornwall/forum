class ForumThread < ApplicationRecord
	belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
	belongs_to :forum, :class_name => 'Forum', :foreign_key => 'forum_id'
	has_many :thread_pages
	has_many :posts, through: :thread_pages

	validates :name, length: {maximum: 40}, presence: true
	validates :description, length: {maximum: 100}
	def to_param
		name
	end	
end
