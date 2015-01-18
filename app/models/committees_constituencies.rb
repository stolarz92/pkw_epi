class CommitteesConstituencies < ActiveRecord::Base
  belongs_to :committee, :foreign_key => :committee_id
  belongs_to :constituency, :foreign_key => :constituency_id
end
