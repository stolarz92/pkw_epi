class CreateCommitteesVoivodeships < ActiveRecord::Migration
  def change
    create_table :committees_voivodeships do |t|
      t.belongs_to :committee, index:true
      t.belongs_to :voivodeship, index:true
      t.boolean :is_chosen

      t.timestamps
    end
  end
end
