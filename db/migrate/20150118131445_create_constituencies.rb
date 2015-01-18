class CreateConstituencies < ActiveRecord::Migration
  def change
    create_table :constituencies do |t|
      t.string :name
      t.integer :voivodeship_id
      t.integer :number_of_mandates
      t.integer :number_of_voters
      t.integer :number_of_used_ballots
      t.integer :valid_votes
      t.integer :invalid_votes_no_choice
      t.integer :invalid_votes_more_choices
      t.integer :invalid_votes_other

      t.timestamps
    end
  end
end
