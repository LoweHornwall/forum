module Pagination
	def get_page_content(list, page_size, wanted_page)
		# ensures the validity of the requested page
		if wanted_page < 1 || wanted_page > divide_pages(list, page_size)
			return nil
		end	

		first_list_obj = (wanted_page - 1) * page_size

		last_list_obj = first_list_obj + page_size - 1

		desired_objects = list[first_list_obj..last_list_obj]

				
		return desired_objects
	end

	def divide_pages(list, page_size)
		obj_num = list.count

		last_page_rest = obj_num % page_size

		page_count = ((list.count - last_page_rest) / page_size)

		#Add another page if there is an unfinished page that goes unacounted for or if there are no pages
		page_count += 1 if last_page_rest > 0 || page_count == 0

		return page_count
	end	
end	