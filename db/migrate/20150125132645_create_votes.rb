class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :committee_id
      t.integer :constituency_id
      t.integer :number_of_votes

      t.timestamps
    end
  end
end
