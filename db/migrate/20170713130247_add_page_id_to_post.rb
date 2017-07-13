class AddPageIdToPost < ActiveRecord::Migration[5.1]
  def change
  	add_column :posts, :thread_page_id, :integer
  end
end
