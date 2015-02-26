class Voivodeship < ActiveRecord::Base
  has_and_belongs_to_many :committees, :join_table => :committees_voivodeships
  has_many :constituencies
  has_many :votes, through: :constituencies

  validates :name,
            :presence => {message: 'Nazwa obowiązkowa!'},
            :length => {
                maximum: 25,
                :message => 'Nazwa jest za długa!'},
            :uniqueness => {
                :case_sensitive => false,
                :message => 'Województwo jest już w bazie'
            }

  validates :places_regional_council,
            :presence => {message: 'Wpisz liczbę mandatów w sejmiku wojewódzkim'},
            :numericality => {
                :only_integer => true,
                :greater_than_or_equal_to => 0,
                :message => 'Wpisz poprawną liczbę'
            }


  def self.set_voivodeship(params)
    Voivodeship.find_by_id(params[:id])
  end

  ### central
  def self.count_votes_for_committees(voivodeship)
    sum = 0
    @results = Hash.new
    voivodeship.committees.each do |committee|
      voivodeship.votes.where("committee_id = ?", committee.id).each { |v| sum += v.number_of_votes }
      @results[committee.name] = sum
      sum = 0
    end

    return @results
  end

  def self.count_voters(voivodeship)
    sum = 0
    voivodeship.constituencies.each { |constituency| sum += constituency.number_of_voters}
    return sum
  end

  def self.count_all_votes(votes, voivodeship)
    sum = 0

    votes.each do |key, value|
      sum += value
    end
    return sum
  end

  def self.count_attendance(voters, ballots)
    attendance = (ballots.to_f / voters.to_f) * 100
    attendance_round = attendance.round(2)
    return attendance_round
  end

  def self.count_all_ballots(voivodeship)
    sum = 0
    voivodeship.constituencies.each {
        |constituency| sum += constituency.number_of_used_ballots if constituency.number_of_used_ballots.present?
    }
    return sum
  end


end
