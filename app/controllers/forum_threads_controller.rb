class ForumThreadsController < ApplicationController
	def index
		@forum_threads = ForumThread.all
	end

	def show
		@forum_thread = ForumThread.find(params[:id])
	end

	def new
		@forum_thread = ForumThread.new
	end

	def create
		@forum_thread = ForumThread.new(forum_thread_params)
		@creator = current_user

		@forum_thread.creator_id = @creator.id
		@forum_thread.creator_name = @creator.name

		if @forum_thread.save
			redirect_to forum_threads_path
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
