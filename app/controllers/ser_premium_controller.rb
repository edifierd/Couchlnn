class SerPremiumController < ApplicationController

  def index
  end

  def show
  end

  def edit    
  end

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

  def create

  end

  def destroy

  end

end
