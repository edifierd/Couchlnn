class ComentarioController < ApplicationController

def show
	@comentario = params[:id]
end

def index
end

def edit
	@comentario = Comentario.find(params[:id])
	@comentario.respuesta = params[:respuesta]
	@comentario.respondido = true
	@comentario.save
	redirect_to(:back)
end



def new
	@comentario = Comentario.new
	@comentario.couch_id = params[:couch_id]
	@comentario.user_id = params[:user_id]
	@comentario.body = params[:body]
	@comentario.save
	redirect_to (Couch.find(params[:couch_id]))
end


end
