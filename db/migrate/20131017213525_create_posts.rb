class CreatePosts < ActiveRecord::Migration
  def up
    create_table :post do |t|
       t.string :name
       t.text :body
       t.timestamps
    end
  end
  def down
  end
end
