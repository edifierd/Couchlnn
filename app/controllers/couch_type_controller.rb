class CouchTypeController < ApplicationController
  def index
    @couch_types = CouchType.all
    if current_user 
      @ability = Ability.new(current_user)
    end
  end

  def show
  	@couch_type = CouchType.find(params[:id])
    if current_user 
      @ability = Ability.new(current_user)
    end
  end

  def new
    @couch_type = CouchType.new
    if current_user 
      @ability = Ability.new(current_user)
    end
  end

  def edit  
    @couch_type = CouchType.find(params[:id])
    if current_user 
      @ability = Ability.new(current_user)
    end
  end

  def update
    @couch_type = CouchType.find(params[:couch_type][:id])
    @couch_type.titulo = params[:couch_type][:titulo]
    @couch_type.descripcion = params[:couch_type][:descripcion]
    @couch_type.enabled = params[:couch_type][:enabled]
    @couch_type.save
    redirect_to (@couch_type)    
  end
    
  def create
    @couch_type = CouchType.new
    @couch_type.titulo = params[:couch_type][:titulo]
    @couch_type.descripcion = params[:couch_type][:descripcion]
    @couch_type.enabled = true
    @couch_type.save
    redirect_to (@couch_type)
  end

  def destroy
  	@couch_type = CouchType.find(params[:id])
  	@couch_type.enabled = false
    @couch_type.save
  	redirect_to (@couch_type)
  end
end

