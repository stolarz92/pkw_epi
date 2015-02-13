class Voivodeship < ActiveRecord::Base
  has_and_belongs_to_many :committees, :join_table => :committees_voivodeships
  has_many :constituencies

  def self.set_voivodeship(params)
    Voivodeship.find_by_id(params[:id])
  end
end
