class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.string :user_id
      t.string :integer
      t.string :lawsuit_id
      t.string :integer

      t.timestamps
    end
    add_index :comments, [:user_id, :created_at]
  end
end
