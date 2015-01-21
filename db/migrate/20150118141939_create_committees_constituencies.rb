class CreateCommitteesConstituencies < ActiveRecord::Migration
  def change
    create_table :committees_constituencies do |t|
      t.belongs_to :committee, index: true
      t.belongs_to :constituency, index: true
      t.integer :number_of_votes

      t.timestamps
    end
  end
end
