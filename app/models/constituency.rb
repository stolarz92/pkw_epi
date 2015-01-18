class Constituency < ActiveRecord::Base
  has_many :committees_constituencies, :dependent => :destroy
  has_many :committees, :through => :committees_constituencies

  belongs_to :voivodeship
end
