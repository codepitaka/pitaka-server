class CreateSnippets < ActiveRecord::Migration[6.0]
  def change
    create_table :snippets do |t|
      t.integer :post_id
      t.integer :status
      t.string :prog_language
      t.text :code

      t.timestamps
    end
  end
end
