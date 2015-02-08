class RemoveLogoFromCommittees < ActiveRecord::Migration
  def change
    remove_column :committees, :logo, :string
  end
end
