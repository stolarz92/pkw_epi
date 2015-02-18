class Constituency < ActiveRecord::Base
  has_many :votes
  belongs_to :voivodeship
  belongs_to :user

  validates :name,
            :presence => {
                message: 'Nazwa jest obowiązkowa'
            },
            :length => {
                maximum: 50,
                :message => 'Nazwa jest za długa!'
            },
            :uniqueness => {
                :case_sensitive => false,
                :message => 'Okręg jest już w bazie'
            }
  validates :voivodeship_id,
            :presence => true
  validates :user_id,
            :presence => true,
            :uniqueness => {
                :message => 'Ten użytkownik jest już przypisany do innego okręgu'
            }
  validates :number_of_voters,
            :presence => true,
            :numericality => {
                :only_integer => true,
                :greater_than_or_equal_to => 0,
            }

  validates :number_of_used_ballots, :invalid_votes_no_choice, :invalid_votes_other, :invalid_votes_more_choices,
            :numericality => {
                :only_integer => true,
                :greater_than_or_equal_to => 0,
            },
            :allow_blank => true

  ### admin ###
  def self.get_constituencies_from_voivodeship(voivodeship_id)
    voivodeship = Voivodeship.find(voivodeship_id)
    @constituencies = voivodeship.constituencies
  end


  ### regional ###
  def self.set_voivodeship(constituency)
    constituency.voivodeship
  end

  def self.count_votes(constituency)
    constituency.each do |const|
      return const.votes.pluck(:number_of_votes).sum
    end
  end

  ### central ###
  def self.count_votes_for_committees(constituency)
    voivodeship = constituency.voivodeship
    sum = 0
    @results = Hash.new
    voivodeship.committees.each do |committee|
      voivodeship.votes.where("committee_id = ? AND constituency_id = ?", committee.id, constituency.id).each { |v| sum += v.number_of_votes }
      @results[committee.name] = sum
      sum = 0
    end

    return @results
  end
end
