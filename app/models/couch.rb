class Couch < ActiveRecord::Base
	belongs_to :user
	has_many :reservations
	has_one :CouchType
	validates :titulo,
	presence: true

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
