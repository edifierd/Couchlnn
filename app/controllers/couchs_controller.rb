class CouchsController < ApplicationController
  load_and_authorize_resource :only => [:index, :show, :edit, :new]
  def index
    @couch = Couch.all
  end

  def show
  	@couch = Couch.find(params[:id])
  end

  def edit    
  end

  def new
     @couch = Couch.new   
  end

  def create
    @couch = Couch.new
    @couch.titulo = params[:couch][:titulo]
    @couch.descripcion = params[:couch][:descripcion]
    @couch.user_id = current_user.id
    @couch.save
    redirect_to couchs_path
  end

  def destroy
  	@couch = Couch.find(params[:id])
  	@couch.destroy
  	redirect_to couchs_path
  end
end
