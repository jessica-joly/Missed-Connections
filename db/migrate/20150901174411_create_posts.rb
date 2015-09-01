class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.column :url, :string
      t.column :user_id, :int
      t.column :keyword_id, :int
    end
  end
end
