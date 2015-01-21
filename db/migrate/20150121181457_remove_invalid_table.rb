class RemoveInvalidTable < ActiveRecord::Migration
  def change
    drop_table :committee_voivodeships
  end
end
