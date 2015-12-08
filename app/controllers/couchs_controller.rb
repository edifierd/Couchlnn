class CouchsController < ApplicationController
  load_and_authorize_resource :only => [:index, :show, :edit, :new]
  def index
    q = ""
    ok=false
    if (params[:capacity] != "Cualquiera")
      q+= "capacity >= " + params[:capacity] + "  "
      ok=true
    end
    if (params[:ubicacion] != "Cualquiera")
      if (ok)
        q+= " AND "
        ok = false
      end
      ok = true
      q+= "location = '" + params[:ubicacion] + "' "
    end
    if (params[:couch][:couch_type_id] != "-1")
      if (ok)
        q+= " AND "
        ok = false
      end
      q+= "couch_type_id = " + params[:couch][:couch_type_id] + " "
    end
    avivable_in_date = Date.civil( params[:couch]["avivable_in_date(1i)"].to_i,
                                          params[:couch]["avivable_in_date(2i)"].to_i,
                                          params[:couch]["avivable_in_date(3i)"].to_i)

   avivable_out_date = Date.civil( params[:couch]["avivable_out_date(1i)"].to_i,
                                          params[:couch]["avivable_out_date(2i)"].to_i,
                                          params[:couch]["avivable_out_date(3i)"].to_i)
   
    q+= " AND '" + avivable_in_date.strftime("%d/%m/%Y") + "' >= avivable_in_date AND '"
    q+= avivable_out_date.strftime("%d/%m/%Y") + "' <= avivable_out_date "



    @couchs = Couch.where( q )
  end

  def show
  	@couch = Couch.find(params[:id])
    @comentarios = Comentario.where(params[:id])
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

    @couch.avivable_in_date = Date.civil( params[:couch]["avivable_in_date(1i)"].to_i,
                                          params[:couch]["avivable_in_date(2i)"].to_i,
                                          params[:couch]["avivable_in_date(3i)"].to_i)

    @couch.avivable_out_date = Date.civil( params[:couch]["avivable_out_date(1i)"].to_i,
                                          params[:couch]["avivable_out_date(2i)"].to_i,
                                          params[:couch]["avivable_out_date(3i)"].to_i)
    pasado_in = ( @couch.avivable_in_date < Date.today )
    pasado_out = ( @couch.avivable_out_date < Date.today )
    
    if(pasado_in)
      flash[:danger] = "NO SE PUEDE SELECCIONAR DE INICIO UNA FECHA EN EL PASADO!!!"
      redirect_to (:back)
    elsif (pasado_out)
      flash[:danger] = "NO SE PUEDE SELECCIONAR DE FINALIZACION UNA FECHA EN EL PASADO!!!"
      redirect_to (:back)
    elsif(@couch.save)
      flash[:success] = "Se modifico con exito el couch"
      redirect_to (:back)
    else
      render 'new'
    end
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

    @couch.avivable_in_date = params[:couch][:avivable_in_date]
    @couch.avivable_in_date = Date.civil( params[:couch]["avivable_in_date(1i)"].to_i,
                                          params[:couch]["avivable_in_date(2i)"].to_i,
                                          params[:couch]["avivable_in_date(3i)"].to_i)

    @couch.avivable_out_date = params[:couch][:avivable_out_date]
    @couch.avivable_out_date = Date.civil( params[:couch]["avivable_out_date(1i)"].to_i,
                                          params[:couch]["avivable_out_date(2i)"].to_i,
                                          params[:couch]["avivable_out_date(3i)"].to_i)
    pasado_in = ( @couch.avivable_in_date < Date.today )
    pasado_out = ( @couch.avivable_out_date < Date.today )
    
    if(pasado_in)
      flash[:danger] = "NO SE PUEDE SELECCIONAR DE INICIO UNA FECHA EN EL PASADO!!!"
      redirect_to (:back)
    elsif (pasado_out)
      flash[:danger] = "NO SE PUEDE SELECCIONAR DE FINALIZACION UNA FECHA EN EL PASADO!!!"
      redirect_to (:back)
    elsif(@couch.save)
      flash[:success] = "Se creo con exito el couch"
      redirect_to (:back)
    else
      render 'new'
    end
    
  end

  def destroy
  	@couch = Couch.find(params[:id])
  	@couch.destroy
  	redirect_to (:back)
  end
end
