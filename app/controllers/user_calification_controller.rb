class UserCalificationController < ApplicationController
	def index
		
	end

	def new
		@user_calification = UserCalification.new
		@user_id = params[:user_id]
		@user_id_propietario = params[:user_id_propietario]
		@reservation_id = params[:reservation_id]
	end

	def create
		@user_califications = UserCalification.where("user_id = "+params[:user_id])
		@user_calification = @user_califications.where("user_id_propietario ="+params[:user_id_propietario])
		if ( @user_calification.count == 0 ) 
			@user_calification = UserCalification.new
			@user_calification.user_id = params[:user_id]
			@user_calification.user_id_propietario = params[:user_id_propietario]
		else
			@user_calification = @user_calification.first
		end
		@user_calification.fecha = Date.today
		@user_calification.puntaje = params[:puntaje]
		@user_calification.save 

		reserva = Reservation.find(params[:reservation_id])
		reserva.user_calification = true
		reserva.save

		redirect_to "/notificaciones/index"
	end

	def show
       @user_calification = params[:id]		
	end
end
