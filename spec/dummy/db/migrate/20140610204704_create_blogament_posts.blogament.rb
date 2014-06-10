# This migration comes from blogament (originally 20140610193157)
class CreateBlogamentPosts < ActiveRecord::Migration
  def change
    create_table :blogament_posts do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
