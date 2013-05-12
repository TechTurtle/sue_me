class CreateLawsuits < ActiveRecord::Migration
  def change
    create_table :lawsuits do |t|
      t.string :title
      t.string :content
      t.integer :user_id
      t.string :suit_type

      t.timestamps
    end
    add_index :lawsuits, [:user_id, :created_at]
  end
end
