class CouchsController < ApplicationController
  load_and_authorize_resource :only => [:index, :show, :edit, :new]
  def index
    @couchs = Couch.where( "capacity >= " + params[:capacity]  + " AND location = '"  + params[:ubicacion] +   "' AND couch_type_id =  " + params[:couch][:couch_type_id]  )
  end

  def show
  	@couch = Couch.find(params[:id])
  end

  def edit
    @couch = Couch.find(params[:id])    
  end

  def update
    @couch = Couch.find(params[:id])
    @couch.titulo = params[:couch][:titulo]
    @couch.descripcion = params[:couch][:descripcion]
    @couch.user_id = current_user.id
    @couch.couch_type_id = params[:couch][:couch_type_id]
    @couch.enable = true
    @couch.url_foto = params[:couch][:url_foto]
    @couch.save
    redirect_to @couch
  end


  def new
     @couch = Couch.new   
  end

  def create
    @couch = Couch.new
    @couch.titulo = params[:couch][:titulo]
    @couch.descripcion = params[:couch][:descripcion]
    @couch.user_id = current_user.id
    @couch.couch_type_id = params[:couch][:couch_type_id]
    @couch.enable = true
    @couch.location = params[:ubicacion]
    @couch.capacity = params[:capacity]
    @couch.url_foto = params[:couch][:url_foto]
    @couch.save

    redirect_to @couch
  end

  def destroy
  	@couch = Couch.find(params[:id])
  	@couch.destroy
  	redirect_to couchs_path
  end
end
