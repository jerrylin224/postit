class RenameColumnsInVotes < ActiveRecord::Migration
  def change
    rename_column :votes, :commentable_id, :voteable_id
    rename_column :votes, :commentable_type, :voteable_type
  end
end
