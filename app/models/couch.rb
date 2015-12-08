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
    	reservas_del_couch = self.reservations # reservas del couch (por el has_many)                                            S
    	reservas_confirmadas = reservas_del_couch.where( "estado = 'reservado'") # solo miramos las reservas confirmadas            
    	reservas_confirmadas = reservas_confirmadas.where('? < end_date', from) # from se copiaría en el lugar de '?'
    	reservas_confirmadas = reservas_confirmadas.where('? > start_date', to) # to se copiaría en el lugar de '?'
    
    # Retorno true o false si el resultado de lo anterior 
    # está vacío o no
    	return (reservas_confirmadas.empty? && from >= self.avivable_in_date && to <= self.avivable_out_date)
  end

  def self.free_couches(from, to)
    result = [] # En result agregaremos los hospedajes libres
    Couch.all.each do |couch|
      result << couch if couch.is_free?(from, to) # Agregamos el hospedaje si está libre
    end
  end

   def calificacionPromedio
    total = 0
    cant_calificaciones = self.couch_calification.count
    if cant_calificaciones > 0 
      self.couch_calification.each do |c|
        total = total + c.puntaje
      end
      rta = (total / cant_calificaciones)
    else
      rta = total 
    end
    return rta
  end

end
