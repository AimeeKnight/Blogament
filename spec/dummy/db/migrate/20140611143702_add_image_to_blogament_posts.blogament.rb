# This migration comes from blogament (originally 20140611143316)
class AddImageToBlogamentPosts < ActiveRecord::Migration
  def change
    add_column :blogament_posts, :image, :string
  end
end
