class PostsController < ApplicationController

	def create
		@thread = ForumThread.find_by_name(params[:name])
		@latest_page = @thread.thread_pages.last
		@current_user = current_user

		@post = Post.new(post_params)

		@post.creator_id = @current_user.id
		@post.creator_name = @current_user.name
		@post.thread_page_id = @latest_page.id
		@post.forum_thread_id = @thread.id

		if @post.valid?
			#if 10 posts have been created on this page, create a new page and save the new post to that page.
			if @latest_page.posts.count > 9
				new_num = @latest_page.page_num + 1

				@latest_page = ThreadPage.new
				@latest_page.page_num = new_num
				@latest_page.forum_thread_id = @thread.id

				@latest_page.save

				@post.thread_page_id = @latest_page.id

			end	
			@post.save
			puts "yey"
			#Redirects to last page.
			redirect_to thread_page_path(@thread, @latest_page.page_num)
		else
			flash[:notice] = "Invalid post."
			redirect_back(fallback_location: root_path)
			puts "ney"	
		end
	end

	private
		def post_params 
			params.require(:post).permit(:message)
		end
end
