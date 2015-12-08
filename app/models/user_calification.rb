class UserCalification < ActiveRecord::Base
	belongs_to :user
 
	validates_inclusion_of :puntaje, in: 1..5

end
