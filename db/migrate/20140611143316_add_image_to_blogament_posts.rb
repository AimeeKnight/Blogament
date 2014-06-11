class AddImageToBlogamentPosts < ActiveRecord::Migration
  def change
    add_column :blogament_posts, :image, :string
  end
end
