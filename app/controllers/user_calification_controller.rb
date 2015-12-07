class UserCalificationController < ApplicationController
	def index
		
	end

	def new
		@user_calification = UserCalification.new
		@user = User.find(params[:user_id])
		@user_propietario = User.find(params[:user_id_propietario])
	end

	def create

		redirect_to "/"
	end

	def show
       @user_calification = params[:id]		
	end
end
