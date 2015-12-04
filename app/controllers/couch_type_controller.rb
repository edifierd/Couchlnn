class CouchTypeController < ApplicationController
  load_and_authorize_resource :only => [:index, :show, :edit, :new]
  def index
    @couch_types = CouchType.all
  end

  def show
  	@couch_type = CouchType.find(params[:id])
  end

  def new
    @couch_type = CouchType.new
  end

  def edit  
    @couch_type = CouchType.find(params[:id])
  end

  def update
    @couch_type = CouchType.find(params[:id])
    @couch_type.titulo = params[:couch_type][:titulo]
    @couch_type.descripcion = params[:couch_type][:descripcion]
    @couch_type.enabled = params[:couch_type][:enabled]
    @couch_type.save
    redirect_to "/couch_type"  
  end
    
  def create

    @couch_type = CouchType.new
    @couch_type.titulo = params[:couch_type][:titulo]
    @couch_type.descripcion = params[:couch_type][:descripcion]
    @couch_type.enabled = true
    if (CouchType.where("titulo = '"+@couch_type.titulo+"'").count > 0)
      redirect_to "/couch_type/new"
    else 
      @couch_type.save
      redirect_to "/couch_type"
    end
  end

  def destroy
  	@couch_type = CouchType.find(params[:id])
  	@couch_type.enabled = false
    @couch_type.save
  	redirect_to "/couch_type"
  end
end

