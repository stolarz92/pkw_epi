class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_one :constituency

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
