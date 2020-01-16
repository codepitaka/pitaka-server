class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.string :theme

      t.timestamps
    end
  end
end
