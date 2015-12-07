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
