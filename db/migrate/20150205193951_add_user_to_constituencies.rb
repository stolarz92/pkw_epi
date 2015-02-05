class AddUserToConstituencies < ActiveRecord::Migration
  def change
    add_reference :constituencies, :user, index: true
  end
end
