class CreateCommitteeVoivodeships < ActiveRecord::Migration
  def change
    create_table :committee_voivodeships do |t|
      t.integer :voivodeship_id
      t.integer :committee_id
      t.integer :is_chosen

      t.timestamps
    end
  end
end
