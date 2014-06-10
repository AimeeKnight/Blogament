class CreateBlogamentComments < ActiveRecord::Migration
  def change
    create_table :blogament_comments do |t|
      t.integer :post_id
      t.text :text

      t.timestamps
    end
  end
end
