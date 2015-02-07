class Committee < ActiveRecord::Base
  has_many :votes
  has_and_belongs_to_many :voivodeships, :join_table => :committees_voivodeships
  has_many :constituencies, :through => :voivodeships
end
