class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :couchs, dependent: :destroy
  
  after_create :assign_default_role

  def assign_default_role
    add_role(:usuario) if self.roles.blank?
  end
end
