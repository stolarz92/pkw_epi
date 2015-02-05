class RenameJoinTable < ActiveRecord::Migration
  def change
    rename_table :committees_voievodships, :committees_voivodeships
  end
end
