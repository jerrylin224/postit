class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :vote
      t.integer :user_id
      t.integer :commentable_id
      t.string :commentable_type
      t.timestamps
    end
  end
end
