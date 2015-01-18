class CreateCommittees < ActiveRecord::Migration
  def change
    create_table :committees do |t|
      t.string :name
      t.integer :voivodeship_id
      t.string :logo

      t.timestamps
    end
  end
end
