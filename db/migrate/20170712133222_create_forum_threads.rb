class CreateForumThreads < ActiveRecord::Migration[5.1]
  def change
    create_table :forum_threads do |t|
      t.string :name
      t.integer :creator_id
      t.timestamps
    end
  end
end
