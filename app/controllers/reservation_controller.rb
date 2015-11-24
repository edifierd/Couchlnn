class ReservationController < ApplicationController

	def index
    @reservation = Reservation.all
  end

  def show
  	@reservation = Couch.find(params[:id]).reservations.new
    @reservation.couch_id = params[:id]
    
    
  end

  def edit    
  end

  def new
     @reservation = Reservation.new   
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
    @reservation.confirmed = false
    
    if (@couch.is_free?(@reservation.start_date,@reservation.end_date))
      @reservation.save
    end

    redirect_to couchs_path
  end

  def destroy
  	@couch = Couch.find(params[:id])
  	@couch.destroy
  	redirect_to couchs_path
  end

end