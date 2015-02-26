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
    if current_user.constituency.present?
      current_user.constituency.voivodeship.committees
    end
  end

  def self.count_invalid_votes_for_voivodeship(voivodeship)
    results = Hash.new
    results['Brak głosu'] = voivodeship.constituencies.pluck(:invalid_votes_no_choice).compact.sum
    results['Więcej niż jeden głos'] = voivodeship.constituencies.pluck(:invalid_votes_more_choices).compact.sum
    results['Inne'] = voivodeship.constituencies.pluck(:invalid_votes_other).compact.sum
    return results
  end

  def self.count_invalid_votes_for_constituency(constituency)
    results = Hash.new
    results['Brak głosu'] = constituency.invalid_votes_no_choice
    results['Więcej niż jeden głos'] = constituency.invalid_votes_more_choices
    results['Inne'] = constituency.invalid_votes_other
    return results
  end

  def self.count_invalid_votes_for_country
    results = Hash.new
    results['Brak głosu'] = Constituency.all.pluck(:invalid_votes_no_choice).compact.sum
    results['Więcej niż jeden głos'] = Constituency.all.pluck(:invalid_votes_more_choices).compact.sum
    results['Inne'] = Constituency.all.pluck(:invalid_votes_other).compact.sum
    return results
  end

=begin
  sum = 0
  @results = Hash.new
  voivodeship.committees.each do |committee|
    voivodeship.votes.where("committee_id = ?", committee.id).each { |v| sum += v.number_of_votes }
    @results[committee.name] = sum
    sum = 0
=end

end
