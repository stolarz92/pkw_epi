class Constituency < ActiveRecord::Base
  has_many :votes

  belongs_to :voivodeship
end
