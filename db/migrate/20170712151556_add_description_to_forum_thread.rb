class AddDescriptionToForumThread < ActiveRecord::Migration[5.1]
  def change
  	add_column :forum_threads, :description, :text
  end
end
