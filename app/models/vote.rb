class Vote < ActiveRecord::Base
  belongs_to :committee
  belongs_to :constituency

  def self.set_vote(params)
    @vote = Vote.find(params[:id])
  end

  def self.set_committee(params)
    @committee = Committee.find(params[:id])
  end

  def self.set_constituency(current_user)
    current_user.constituency
  end

  def self.get_all_committees_for_current_user(current_user)
    current_user.constituency.voivodeship.committees
  end

  def self.get_votes_for_committees(committees)
    committees.each do |committee|
      return committee.votes.all
    end
  end
end
