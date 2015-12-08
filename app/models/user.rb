class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :couchs, dependent: :destroy

  has_many :user_califications, dependent: :destroy
  belongs_to :user_calification
  
  after_create :assign_default_role

  def assign_default_role
    add_role(:usuario) if self.roles.blank?
  end

  scope :by_email, -> email { where(email: email) }
  validates_presence_of :first_name, :last_name, :secret_question, :age
  validates_inclusion_of :age, in: 18..99

  def calificacionPromedio
    total = 0
    cant_calificaciones = self.user_califications.count
    if cant_calificaciones > 0 
      self.user_califications.each do |c|
        total = total + c.puntaje
      end
      rta = (total / cant_calificaciones)
    else
      rta = total 
    end
    return rta
  end


end
