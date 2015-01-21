class Committee < ActiveRecord::Base
  has_many :votes
  has_many :constituencies, :through => :voivodeships
  has_and_belongs_to_many :voivodeships
end
