class CouchTypeController < ApplicationController
  def index
    @couch_type = Couch_type.all
  end

  def show
  	@couch = Couch.find(params[:id])
  end

  def edit    
  end

  def create
  end

  def destroy
  	@couch = Couch.find(params[:id])
  	@couch.destroy
  	redirect_to couchs_path
  end
end

