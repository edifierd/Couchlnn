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
		current_user.add_role "premium"
  	else
  		redirect_to "/ser_premium/index"
  	end
  end

  def create

  end

  def destroy

  end

end
