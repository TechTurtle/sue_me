class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :user_id
      t.integer :lawsuit_id

      t.timestamps
    end
    add_index :comments, [:user_id, :created_at]
  end
end
