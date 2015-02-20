class Committee < ActiveRecord::Base
  has_many :votes
  has_and_belongs_to_many :voivodeships, :join_table => :committees_voivodeships
  has_many :constituencies, :through => :voivodeships

  has_attached_file :image,
                    styles: {
                        small: "32x32",
                        med: "100x100",
                        large: "200x200"
                    }
  validates_attachment_content_type :image,
                                    :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/svn"]

  validates :name,
            :presence => {
                message: 'Nazwa obowiązkowa'
            },
            :length => {
                maximum: 50,
                :message => 'Nazwa jest za długa!'
            },
            :uniqueness => {
                :case_sensitive => false,
                :message => "Okręg jest już w bazie"
            }

  ### admin ###
  def self.set_committee(params)
    Committee.find_by_id(params[:id])
  end

  def self.set_constituency(current_user)
    current_user.constituency
  end

  def self.find_committees_for_constituency(current_user)
    current_user.constituency.voivodeship.committees.map
  end

  ### central ###
  def self.count_votes_for_committees(committees)
    sum = 0
    @results = Hash.new
    committees.each do |committee|
      committee.votes.where("committee_id = ?", committee.id).each { |v| sum += v.number_of_votes }
      @results[committee.name] = sum
      sum = 0
    end
    return @results
  end

  def self.count_votes_for_committee(committee)
    sum = 0
    committee.votes.each do |v|
      sum += v.number_of_votes
    end
    return sum
  end

  def self.count_all_ballots
    ballots = 0
    constituencies = Constituency.all
    constituencies.each do |constituency|
      ballots += constituency.number_of_used_ballots if constituency.number_of_used_ballots.present?
    end
    return ballots
  end

  def self.count_result_in_percent(votes, ballots)
    result = ((votes.to_f/ballots.to_f)*100).round(2)
    return result
  end

end
