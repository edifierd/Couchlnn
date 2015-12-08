class AddRespuestaComentario2 < ActiveRecord::Migration
  def change
  	remove_column :reservations, :respuesta
  	add_column :comentarios, :respuesta, :text
  end
end
