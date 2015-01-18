class Voivodeship < ActiveRecord::Base
  has_many :committees_voivodeships, :dependent => :destroy
  has_many :committees, :through => :committees_voivodeships

  has_many :constituencies
end
