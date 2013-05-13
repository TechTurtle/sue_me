class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :lawsuit_id
      t.boolean :positive

      t.timestamps
    end
    add_index :votes, [:lawsuit_id]
  end
end
