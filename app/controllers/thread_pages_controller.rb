class ThreadPagesController < ApplicationController
	def show
		@thread = ForumThread.find_by_name(params[:name])
	end
end
