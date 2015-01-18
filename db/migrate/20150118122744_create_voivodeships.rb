class CreateVoivodeships < ActiveRecord::Migration
  def change
    create_table :voivodeships do |t|
      t.string :name
      t.integer :places_regional_council

      t.timestamps
    end
  end
end
