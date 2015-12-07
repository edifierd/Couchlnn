class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Atiende las excepciones de CanCanCan
  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
  end

helper_method :cantidadNotificaciones

def cantidadNotificaciones
	cant = 0
	Reservation.all.each do |res|  
		if (Couch.find(res.couch_id).user.id == current_user.id) and (res.is_pendiente?)
			cant = cant + 1
		end
	end 
	return cant
end

def reservasFinalizadas
	
end


end
