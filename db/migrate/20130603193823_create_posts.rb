class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :screen_name
      t.text :text
      t.text :profile

      t.timestamps
    end
  end
end
