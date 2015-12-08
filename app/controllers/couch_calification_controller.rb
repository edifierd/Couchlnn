class CouchCalificationController < ApplicationController

  	def new
		@couch_calification = CouchCalification.new
		@user_id = params[:user_id]
		@couch_id = params[:couch_id]
		@reservation_id = params[:reservation_id]
	end 

	def create
		@couch_califications = CouchCalification.where("user_id = "+params[:user_id])
		@couch_calification = @couch_califications.where("couch_id ="+params[:couch_id])
		if ( @couch_calification.count == 0 ) 
			@couch_calification = CouchCalification.new
			@couch_calification.user_id = params[:user_id]
			@couch_calification.couch_id = params[:couch_id]
		else
			@couch_calification = @couch_calification.first
		end
		@couch_calification.fecha = Date.today
		@couch_calification.puntaje = params[:puntaje]
		@couch_calification.save 

		reserva = Reservation.find(params[:reservation_id])
		reserva.couch_calification = true
		reserva.save

		redirect_to "/notificaciones/index"
	end
	
end
