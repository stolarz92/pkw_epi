class CommitteesVoivodeships < ActiveRecord::Base
  belongs_to :committee, :foreign_key => :committee_id
  belongs_to :voivodeship, :foreign_key => :voivodeship_id
end
