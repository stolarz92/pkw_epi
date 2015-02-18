class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_one :constituency

  validates :name,
            :presence => true,
            :length => {
                maximum: 30,
                :message => 'Za długa nazwa'
            },
            :uniqueness => {
                :case_sensitive => false,
                :message => 'Użytkownik jest już w bazie'
            }

  validates :email,
            :email => true
  validates :encrypted_password,
            :presence => true,
            :length => {
                minimum: 6,
                :message => 'Hasło jest za krótkie'
            }
  validates :role_id,
            :presence => true

  def admin?
    self.role.name == "Admin"
  end
  def central?
    self.role.name == "Central"
  end
  def regional?
    self.role.name == "Regional"
  end
end
