class AddAuthorIdToBlogamentPosts < ActiveRecord::Migration
  def change
    add_column :blogament_posts, :author_id, :integer
  end
end
