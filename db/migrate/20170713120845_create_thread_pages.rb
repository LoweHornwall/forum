class CreateThreadPages < ActiveRecord::Migration[5.1]
  def change
    create_table :thread_pages do |t|
      t.integer :page_num
      t.integer :forum_thread_id			
      t.timestamps
    end
  end
end
