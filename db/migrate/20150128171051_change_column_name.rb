class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :committees_voivodeships, :voievodship_id, :voivodeship_id
  end
end
