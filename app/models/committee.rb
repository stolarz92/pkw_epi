class Committee < ActiveRecord::Base
  has_many :votes
  has_and_belongs_to_many :voivodeships
  has_many :constituencies, :through => :voivodeships
end
