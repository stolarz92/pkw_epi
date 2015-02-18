class Voivodeship < ActiveRecord::Base
  has_and_belongs_to_many :committees, :join_table => :committees_voivodeships
  has_many :constituencies
  has_many :votes, through: :constituencies

  validates :name,
            :presence => {message: 'Nazwa obowiązkowa!'},
            :length => {
                maximum: 25,
                :message => 'Nazwa jest za długa!'},
            :uniqueness => {
                :case_sensitive => false,
                :message => 'Województwo jest już w bazie'
            }

  validates :places_regional_council,
            :presence => {message: 'Wpisz liczbę mandatów w sejmiku wojewódzkim'},
            :numericality => {
                :only_integer => true,
                :greater_than_or_equal_to => 0,
                :message => 'Wpisz poprawną liczbę'
            }


  def self.set_voivodeship(params)
    Voivodeship.find_by_id(params[:id])
  end
end
