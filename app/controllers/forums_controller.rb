class ForumsController < ApplicationController
	def index

	end

	def show
		@posts = Post.all
		@page_size = 5

		if @wanted_posts = get_page_content(@posts, @page_size, params[:forum_page_num].to_i)

		else
			redirect_to forum_page_path(params[:name], 1)
		end	

		@page_count = divide_pages(@posts, @page_size)
	end

	private
		def get_page_content(list, page_size, wanted_page)
			# ensures the validity of the requested page
			if wanted_page < 1 || wanted_page > divide_pages(list, page_size)
				return nil
			end	
			
			first_list_obj = (wanted_page - 1) * page_size
			puts "First index #{first_list_obj}"

			last_list_obj = first_list_obj + page_size - 1
			puts "Second index #{last_list_obj}"

			desired_objects = list[first_list_obj..last_list_obj]

			
			return desired_objects
		end

		def divide_pages(list, page_size)
			obj_num = list.count

			last_page_rest = obj_num % page_size

			page_count = ((list.count - last_page_rest) / page_size) + 1 

			return page_count
		end
end
