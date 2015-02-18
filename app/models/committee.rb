class Committee < ActiveRecord::Base
  has_many :votes
  has_and_belongs_to_many :voivodeships, :join_table => :committees_voivodeships
  has_many :constituencies, :through => :voivodeships

  has_attached_file :image,
                    styles: {
                        small: "32x32",
                        med: "100x100",
                        large: "200x200"
                    }
  validates_attachment_content_type :image,
                                    :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/svn"]

  validates :name,
            :presence => {
                message: 'Nazwa obowiązkowa'
            },
            :length => {
                maximum: 50,
                :message => 'Nazwa jest za długa!'
            },
            :uniqueness => {
                :case_sensitive => false,
                :message => "Okręg jest już w bazie"
            }


  def self.set_committee(params)
    Committee.find_by_id(params[:id])
  end

  def self.set_constituency(current_user)
    current_user.constituency
  end

  def self.find_committees_for_constituency(current_user)
    current_user.constituency.voivodeship.committees.map
  end

end
