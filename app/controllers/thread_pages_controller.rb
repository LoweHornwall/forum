class ThreadPagesController < ApplicationController
	def show
		@thread = ForumThread.find_by_name(params[:name])
		@thread_pages = @thread.thread_pages
		if @page = @thread_pages.find_by_page_num(params[:page_num])
			@posts = @page.posts
		else
			#unless the page exists go gack to the first page
			redirect_to thread_page_path(@thread, 1)
		end	

	end
end
