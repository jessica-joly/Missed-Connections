class Keywordsusers < ActiveRecord::Migration
  def change
    create_table(:keywords_users) do |t|
      t.column(:keyword_id, :integer)
      t.column(:user_id, :integer)

      t.timestamps()
    end
  end
end
