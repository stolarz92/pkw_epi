class Constituency < ActiveRecord::Base
  has_many :votes
  belongs_to :voivodeship
  belongs_to :user

  def self.get_constituencies_from_voivodeship(voivodeship_id)
    voivodeship = Voivodeship.find(voivodeship_id)
    @constituencies = voivodeship.constituencies
  end

end
