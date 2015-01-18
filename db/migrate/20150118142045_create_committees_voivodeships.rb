class CreateCommitteesVoivodeships < ActiveRecord::Migration
  def change
    create_table :committees_voivodeships do |t|
      t.integer :committee_id
      t.integer :voivodeship_id
      t.boolean :is_chosen

      t.timestamps
    end
  end
end
