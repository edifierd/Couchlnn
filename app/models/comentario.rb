class Comentario < ActiveRecord::Base
	belongs_to :couch
	belongs_to :user

	
end
