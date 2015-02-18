class Vote < ActiveRecord::Base
  belongs_to :committee
  belongs_to :constituency

  validates :number_of_votes,
            :presence => true,
            :numericality => {
                :only_integer => true,
                :greater_than_or_equal_to => 0,
            }
  validates :constituency_id, :presence => true
  validates :committee_id,
            :presence => true,
            :uniqueness => {
                scope: :constituency_id,
                :case_sensitive => false,
                :message => 'Wybrany komitet ma już przypisane głosy w tym okręgu'}


  def self.get_votes(constituency_id, committees)
    Vote.includes(:committee).where("constituency_id = ?", constituency_id)
  end

  def self.get_all_committees_for_current_constituency(current_user)
    current_user.constituency.voivodeship.committees
  end

end
