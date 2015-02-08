class AddPaperclipToCommittee < ActiveRecord::Migration
  def change
    add_attachment :committees, :image
  end
end
