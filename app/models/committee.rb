class Committee < ActiveRecord::Base
  has_many :committees_constituencies, :dependent => :destroy
  has_many :constituencies, :through => :committees_constituencies

  has_many :committees_voivodeships, :dependent => :destroy
  has_many :voivodeships, :through => :committees_voivodeships
end
