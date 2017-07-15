class AddForumIdToForumThread < ActiveRecord::Migration[5.1]
  def change
  	add_column :forum_threads, :forum_id, :integer
  end
end
