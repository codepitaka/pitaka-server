class CreateUserBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :user_blogs do |t|
      t.integer :user_id
      t.integer :blog_id
      t.integer :status

      t.timestamps
    end
  end
end
