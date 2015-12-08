class SerPremiumController < ApplicationController

  def new
  	if params[:nombre] != '' and  params[:secret]  != '' and  params[:num] != ''
		  @nombre = params[:nombre]
      @pago = rand(10..300)
      @fecha = Time.now
		  current_user.add_role "premium"
      current_user.pago = @pago
      current_user.fechaPago = @fecha
      current_user.save
  	else
  		redirect_to "/ser_premium/index"
  	end
  end


  def ganancias

  end

  def buscar

  @users = []
  in_date = Date.civil(                   params[:reservation]["start_date(1i)"].to_i,
                                          params[:reservation]["start_date(2i)"].to_i,
                                          params[:reservation]["start_date(3i)"].to_i)

  out_date = Date.civil(                  params[:reservation]["end_date(1i)"].to_i,
                                          params[:reservation]["end_date(2i)"].to_i,
                                          params[:reservation]["end_date(3i)"].to_i)

  User.all.each do |user|
      @users << user if ((user.has_role?  :premium) && user.fechaPago >= in_date && user.fechaPago <= out_date )   
  end
  
  end
end
