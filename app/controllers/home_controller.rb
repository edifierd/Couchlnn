class HomeController < ActionController::Base

  def index
  	if current_user
  		@ability = Ability.new(current_user)
  	end
  end

  #def show
  #end
  
  #def ver    
  #end
  
  #def destroy
  #end
end
