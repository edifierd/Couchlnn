class CouchCalification < ActiveRecord::Base
	belongs_to :couch
 
	validates_inclusion_of :puntaje, in: 1..5

end
