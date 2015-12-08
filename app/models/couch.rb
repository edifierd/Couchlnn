class Couch < ActiveRecord::Base
	belongs_to :user
	has_many :reservations, dependent: :destroy
  has_many :comentarios, dependent: :destroy
  has_many :couch_calification, dependent: :destroy
	has_one :CouchType
	validates_presence_of :titulo, :capacity, :descripcion


  def validate_before_create
    self.errors.add(:avivable_in_date, "is invalid") if self.avivable_in_date < Time.now()
  end

	def is_owner?(user)
    	return (user.id==self.user_id)
  end

  def is_free?(from, to)
    	reservas_del_couch = self.reservations # reservas del couch (por el has_many)
    	reservas_confirmadas = reservas_del_couch.confirmed # solo miramos las confirmadas
    	reservas_confirmadas.where('? < end_date', from) # from se copiaría en el lugar de '?'
    	reservas_confirmadas.where('? > start_date', to) # to se copiaría en el lugar de '?'
    
    # Retorno true o false si el resultado de lo anterior 
    # está vacío o no
    	return reservas_confirmadas.empty?
  end

  def self.free_couches(from, to)
    result = [] # En result agregaremos los hospedajes libres
    Couch.all.each do |couch|
      result << couch if couch.is_free?(from, to) # Agregamos el hospedaje si está libre
    end
  end

end
