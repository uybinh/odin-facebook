class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :post
      t.references :author, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
