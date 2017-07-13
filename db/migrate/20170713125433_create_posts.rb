class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :creator_id
      t.string :creator_name
      t.text :message
      t.timestamps
    end
  end
end
