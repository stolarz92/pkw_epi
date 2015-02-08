class AddAttachmentLogoToCommittees < ActiveRecord::Migration
  def self.up
    change_table :committees do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :committees, :logo
  end
end
