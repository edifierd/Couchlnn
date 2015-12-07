class ReservationController < ApplicationController
#  load_and_authorize_resource :only => [:index, :show, :edit, :new]

	def index
    @reservation = Reservation.all
  end

  def show
  	@reservation = Couch.find(params[:id]).reservations.new
    @reservation.couch_id = params[:id]
    
  end

  def edit
     
    @reservation = Reservation.find(params[:id])
    @couch=Couch.find(@reservation.couch_id)
    @reservation.confirmed = true
    ok = (@couch.is_free?(@reservation.start_date,@reservation.end_date))
    if (ok)
      flash[:success] = "RESERVA CONFIRMADA"
      @reservation.save
      redirect_to current_user  
    else
      flash[:danger] = "IMPOSIBLE CONFIRMAR RESERVA : INTERVALO TEMPORAL OCUPADO"
      redirect_to (:back)
    end 
  end

  def new
     @reservation = Reservation.new 
     @reservation.couch_id = params[:id]  
  end

  def create
    @couch=Couch.find(params[:couch_id])
    @reservation = @couch.reservations.new
    @reservation.user_id = current_user.id
    @reservation.start_date = params[:reservation][:start_date]
    @reservation.start_date = Date.civil( params[:reservation]["start_date(1i)"].to_i,
                                          params[:reservation]["start_date(2i)"].to_i,
                                          params[:reservation]["start_date(3i)"].to_i)
    @reservation.end_date = params[:reservation][:end_date]
    @reservation.end_date = Date.civil(   params[:reservation]["end_date(1i)"].to_i,
                                          params[:reservation]["end_date(2i)"].to_i,
                                          params[:reservation]["end_date(3i)"].to_i)
    @reservation.confirmed = false
    ok = (@couch.is_free?(@reservation.start_date,@reservation.end_date))
    if (ok)
      flash[:success] = "RESERVA ADQUIRIDA"
      @reservation.save
      redirect_to current_user  
    else
      flash[:danger] = "INTERVALO TEMPORAL OCUPADO"
      redirect_to (:back)
    end

    end

  def destroy
    @reservation = Reservation.find(params[:id])
  	@reservation.destroy
  	redirect_to "/reservation/"
  end

end