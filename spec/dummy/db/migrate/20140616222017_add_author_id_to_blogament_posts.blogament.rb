# This migration comes from blogament (originally 20140610202903)
class AddAuthorIdToBlogamentPosts < ActiveRecord::Migration
  def change
    add_column :blogament_posts, :author_id, :integer
  end
end
