class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :genre, :age, :secret_question, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :genre, :age, :secret_question, :avatar_img, :password, :password_confirmation, :current_password)
  end

end