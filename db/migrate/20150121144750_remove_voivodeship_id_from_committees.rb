class RemoveVoivodeshipIdFromCommittees < ActiveRecord::Migration
  def change
    remove_column :committees, :voivodeship_id, :integer
  end
end
