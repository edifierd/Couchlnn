class ReservationController < ApplicationController
#  load_and_authorize_resource :only => [:index, :show, :edit, :new]

	def index
    @reservation = Reservation.all
  end

  def buscar
    @reservations=Reservation.new
    start_date = Date.civil(              params[:reservation]["start_date(1i)"].to_i,
                                          params[:reservation]["start_date(2i)"].to_i,
                                          params[:reservation]["start_date(3i)"].to_i)

    end_date = Date.civil(                params[:reservation]["end_date(1i)"].to_i,
                                          params[:reservation]["end_date(2i)"].to_i,
                                          params[:reservation]["end_date(3i)"].to_i)
   @reservations=@reservations.is_range(start_date,end_date)

  end

  def show
    @couch = Couch.find(params[:id])
    @reservation = @couch.reservations.new
    @reservation.couch_id=params[:id]
   
  end

  def edit
    @reservation = Reservation.find(params[:id])
    @couch=Couch.find(@reservation.couch_id)
    @reservation.estado = "reservado"
    ok = (@couch.is_free?(@reservation.start_date,@reservation.end_date))
    ok2 = ((@reservation.start_date >= @couch.avivable_in_date) and (@reservation.end_date >= @couch.avivable_in_date) and (@reservation.start_date <= @couch.avivable_out_date) and (@reservation.end_date <= @couch.avivable_out_date))
    if (ok and ok2)
      flash[:success] = "RESERVA CONFIRMADA"
      @reservation.save
      redirect_to (:back)  
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
    @reservation.start_date = Date.civil( params[:reservation]["start_date(1i)"].to_i,
                                          params[:reservation]["start_date(2i)"].to_i,
                                          params[:reservation]["start_date(3i)"].to_i)
    @reservation.end_date = params[:reservation][:end_date]
    @reservation.end_date = Date.civil(   params[:reservation]["end_date(1i)"].to_i,
                                          params[:reservation]["end_date(2i)"].to_i,
                                          params[:reservation]["end_date(3i)"].to_i)
    @reservation.estado = "pendiente"
    ok = (@couch.is_free?(@reservation.start_date,@reservation.end_date))
    ok2 = ((@reservation.start_date >= @couch.avivable_in_date) and (@reservation.end_date >= @couch.avivable_in_date) and (@reservation.start_date <= @couch.avivable_out_date) and (@reservation.end_date <= @couch.avivable_out_date))

    if (ok )
      flash[:success] = "PEDIDO DE RESERVA ENVIADO"
      @reservation.save
      redirect_to (:back)  
    else
      flash[:danger] = "INTERVALO TEMPORAL OCUPADO"
      redirect_to (:back)
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
  	@reservation.estado = "rechazado"
    @reservation.save
  	redirect_to (:back)
  end

end