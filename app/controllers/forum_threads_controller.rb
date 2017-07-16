class ForumThreadsController < ApplicationController
	def index
		@forum_threads = ForumThread.all
	end

	def show
		@forum_thread = ForumThread.find_by_name(params[:name])
	end

	def new
		@forum_thread = ForumThread.new
	end

	def create
		@forum_thread = ForumThread.new(forum_thread_params)
		@creator = current_user
		@forum = Forum.find_by_name(params[:name])

		@forum_thread.creator_id = @creator.id
		@forum_thread.creator_name = @creator.name
		@forum_thread.forum_id = @forum.id

		if @forum_thread.save 
			# This code needs to be looked at and made cleaner.
			@initial_page = ThreadPage.new
			@initial_page.forum_thread_id = @forum_thread.id
			@initial_page.page_num = 1
			@initial_page.save

			redirect_to forum_page_path(@forum, 1)
		else
			render 'new'
		end		
	end

	def destroy

	end

	private
		def forum_thread_params
			params.require(:forum_thread).permit(:name, :description)
		end
end
