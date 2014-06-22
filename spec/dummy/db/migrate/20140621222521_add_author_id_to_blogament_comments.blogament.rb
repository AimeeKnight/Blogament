# This migration comes from blogament (originally 20140621222032)
class AddAuthorIdToBlogamentComments < ActiveRecord::Migration
  def change
    add_column :blogament_comments, :author_id, :integer
  end
end
