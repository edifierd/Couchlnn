class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Atiende las excepciones de CanCanCan
  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
  end

helper_method :cantidadNotificaciones, :reservasFinalizadas

def cantidadNotificaciones
	cant = 0
	#SOLICITUDES DE RESERVA
	Reservation.all.each do |res|  
		if (Couch.find(res.couch_id).user.id == current_user.id) and (res.is_pendiente?)
			cant = cant + 1
		end
	end 
	#CALIFICACIONES DE USUARIOS PENDIENTES
	Reservation.where("estado = 'finalizado' ").each do |res|
		if (Couch.find(res.couch_id).user.id == current_user.id) and (!res.user_calification)
			cant = cant + 1
		end
	end
	#CALIFICACIONES DE COUCH PENDIENTES
	Reservation.where("estado = 'finalizado' ").each do |res|
		if (res.user_id == current_user.id) and (!res.couch_calification)
			cant = cant + 1
		end
	end

	return cant
end

def reservasFinalizadas
	Reservation.where("estado <> 'finalizado' ").each do |res|
		if (res.end_date < Date.today )
			res.estado = "finalizado"
			res.save
		end
	end
	return nil
end


end
