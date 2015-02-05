class CreateCommitteesVoievodships < ActiveRecord::Migration
  def change
    create_table :committees_voievodships do |t|
      t.references :committee, index: true
      t.references :voievodship, index: true
    end
  end
end
