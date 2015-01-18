class CreateCommitteesConstituencies < ActiveRecord::Migration
  def change
    create_table :committees_constituencies do |t|
      t.integer :committee_id
      t.integer :constituency_id
      t.integer :number_of_votes

      t.timestamps
    end
  end
end
