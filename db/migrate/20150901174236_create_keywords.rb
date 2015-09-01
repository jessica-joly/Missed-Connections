class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.column :keyword, :string
      t.timestamps
    end
  end
end
