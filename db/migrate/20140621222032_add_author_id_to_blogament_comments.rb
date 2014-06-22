class AddAuthorIdToBlogamentComments < ActiveRecord::Migration
  def change
    add_column :blogament_comments, :author_id, :integer
  end
end
