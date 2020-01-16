class AddBlogIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :blog_id, :integer
  end
end
