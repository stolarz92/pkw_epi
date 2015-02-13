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

  def self.set_committee(params)
    Committee.find_by_id(params[:id])
  end

end
