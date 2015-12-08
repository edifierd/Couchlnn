class PasswordResetController < ApplicationController
	def index
	end

	def new
		if (User.by_email(params[:email]).count == 1)
			user = User.by_email(params[:email]).first
			if (user.secret_question == params[:secret_question])
				user.password = "12345678"
				user.password_confirmation = "12345678"
  				user.save
  			else
  				redirect_to :back
  			end
		else
			redirect_to :back
		end
	end
end

