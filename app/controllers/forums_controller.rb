class ForumsController < ApplicationController
	include Pagination

	def index
		@forums = Forum.all
	end

	def show
		# Prevents sql injections in order command
		@forum = Forum.find_by_name(params[:name])

		sanitized_order = ForumThread.send(:sanitize_sql_for_order, params[:sort_by])
		@forum_threads = @forum.forum_threads.order(sanitized_order).all
		@page_size = 10
		@current_page = params[:forum_page_num].to_i

		#fastnar i en loop när inga threads finns!
		@wanted_threads = get_page_content(@forum_threads, @page_size, @current_page)
		@page_count = divide_pages(@forum_threads, @page_size)

		if @current_page < 1 || @current_page > @page_count
			redirect_to forum_page_path(@forum, 1)
		end
	end

	def new
		@forum = Forum.new
	end

	def create
		@forum = Forum.new(forum_params)

		if @forum.save
			redirect_to forums_path
		else
			render 'new'
		end	
	end

	private
		def forum_params
			params.require(:forum).permit(:name, :description)
		end
end
