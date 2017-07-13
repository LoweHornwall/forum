class PostsController < ApplicationController

	def create
		@thread = ForumThread.find_by_name(params[:name])
		@latest_page = @thread.thread_pages.last
		@current_user = current_user

		@post = Post.new(post_params)

		#if 10 posts have been created on this page, create a new page and save the new post to that page.
		if @latest_page.posts.count > 9
			new_num = @latest_page.page_num + 1
			id = @thread.id

			@latest_page = ThreadPage.new
			@latest_page.page_num = new_num
			@latest_page.forum_thread_id = id

			@latest_page.save
		end	
		
		puts @current_user.name

		@post.creator_id = @current_user.id
		@post.creator_name = @current_user.name
		@post.thread_page_id = @latest_page.id

		if @post.save
			puts "yey"
			redirect_back(fallback_location: root_path)
		else
			puts "ney"	
		end
	end

	private
		def post_params 
			params.require(:post).permit(:message)
		end
end
