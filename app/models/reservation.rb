class Reservation < ActiveRecord::Base
	belongs_to :user
	has_one :couch
 
	scope :confirmed, -> { where(estado: "reservado") }

	def is_pendiente?
		rta = false
		if(self.estado == "pendiente")
			rta = true
		end
		return rta
	end

	def is_range(from, to)
		reservas_ok=[]
    	reservas = Reservation.all                                        
    	reservas_ok = reservas.where( "estado = 'reservado' OR estado = 'finalizado'") # solo miramos las reservas confirmadas            
    	reservas_ok = reservas_ok.where('? >= reservation_date', to) # from se copiaría en el lugar de '?'
    	reservas_ok = reservas_ok.where('? <= reservation_date', from) # to se copiaría en el lugar de '?'
    
    # Retorno true o false si el resultado de lo anterior 
    # está vacío o no
    	return reservas_ok
  end

	def is_reservado?
		rta = false
		if(self.estado == "reservado")
			rta = true
	    end
		return rta
	end

	def is_rechazado?
		rta = false
		if(self.estado == "rechazado")
			rta = true
		end
		return rta
	end

	def is_finalizado?
		rta = false
		if(self.estado == "finalizado")
			rta = true
		end
		return rta
	end

end
