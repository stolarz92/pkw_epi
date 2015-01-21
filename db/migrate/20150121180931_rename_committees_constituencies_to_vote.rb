class RenameCommitteesConstituenciesToVote < ActiveRecord::Migration
  def change
    rename_table :committees_constituencies, :votes
  end
end
